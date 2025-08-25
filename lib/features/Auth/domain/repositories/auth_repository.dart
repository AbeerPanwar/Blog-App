import 'package:blog_app/core/error/faliure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Faliure, String>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Faliure, String>> signIn({
    required String email,
    required String password,
  });
}
