import 'package:blog_app/core/error/faliure.dart';
import 'package:blog_app/features/Auth/domain/entities/profile.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Faliure, Profile>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Faliure, Profile>> signIn({
    required String email,
    required String password,
  });
}
