import 'package:blog_app/core/error/faliure.dart';
import 'package:blog_app/core/usecase/use_case.dart';
import 'package:blog_app/features/Auth/domain/entities/profile.dart';
import 'package:blog_app/features/Auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignIn implements UseCase<Profile, UserSignInParams> {
  final AuthRepository authRepository;

  UserSignIn(this.authRepository);

  @override
  Future<Either<Faliure, Profile>> call(UserSignInParams params) async {
    return await authRepository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({required this.email, required this.password});
}
