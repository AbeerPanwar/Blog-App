import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/faliure.dart';
import 'package:blog_app/features/Auth/data/data_sources/auth_supabase_source.dart';
import 'package:blog_app/features/Auth/domain/repositories/Auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSupabaseSource supabaseSource;
  AuthRepositoryImpl(this.supabaseSource);

  @override
  Future<Either<Faliure, String>> signIn({
    required String email,
    required String password,
  }) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Faliure, String>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await supabaseSource.signUp( 
        name: name, 
        email: email, 
        password: password
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Faliure(e.message));
    }
  }
}
