import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/faliure.dart';
import 'package:blog_app/features/Auth/data/data_sources/auth_supabase_source.dart';
import 'package:blog_app/features/Auth/domain/entities/profile.dart';
import 'package:blog_app/features/Auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSupabaseSource supabaseSource;
  AuthRepositoryImpl(this.supabaseSource);

  @override
  Future<Either<Faliure, Profile>> currentUser() async {
    try{
      final user = await supabaseSource.getCurrentUserData();
      if (user == null){
        return left(Faliure('user is not logged in!!'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Faliure(e.message));
    }
  }

  @override
  Future<Either<Faliure, Profile>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabaseSource.signIn(
        email: email,
        password: password,
      );
      return right(user);
      
    } on ServerException catch (e) {
      return left(Faliure(e.message));
    }
  }

  @override
  Future<Either<Faliure, Profile>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabaseSource.signUp(
        name: name,
        email: email,
        password: password,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Faliure(e.message));
    }
  }
  
}
