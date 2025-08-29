import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/features/Auth/data/data_sources/auth_supabase_source.dart';
import 'package:blog_app/features/Auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/Auth/domain/use_cases/user_sign_in.dart';
import 'package:blog_app/features/Auth/domain/use_cases/user_sign_up.dart';
import 'package:blog_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/Auth/presentation/pages/sign_up.dart';
import 'package:blog_app/features/Auth/presentation/pages/sing_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  ;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            userSignUp: UserSignUp(
              AuthRepositoryImpl(AuthSupabaseSourceImpl(supabase.client)),
            ),
            userSignIn: UserSignIn(
              AuthRepositoryImpl(AuthSupabaseSourceImpl(supabase.client)),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkTheme,
      routes: {
        'signUpPage': (context) => SignUpPage(),
        'signInPage': (context) => SignInPage(),
      },
      home: const SignInPage(),
    );
  }
}
