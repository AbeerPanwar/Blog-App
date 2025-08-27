import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:blog_app/features/Auth/data/data_sources/auth_supabase_source.dart';
import 'package:blog_app/features/Auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/Auth/domain/repositories/Auth_repository.dart';
import 'package:blog_app/features/Auth/domain/use_cases/user_sign_up.dart';
import 'package:blog_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  final supabase = Supabase.instance.client;
  serviceLocator.registerLazySingleton(() => supabase);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthSupabaseSource>(
    () => AuthSupabaseSourceImpl(serviceLocator()),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));

  serviceLocator.registerLazySingleton(
    () => AuthBloc(userSignUp: serviceLocator()),
  );
}
