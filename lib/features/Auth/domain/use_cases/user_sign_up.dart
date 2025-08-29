import 'package:blog_app/core/error/faliure.dart';
import 'package:blog_app/core/usecase/use_case.dart';
import 'package:blog_app/features/Auth/domain/entities/profile.dart';
import 'package:blog_app/features/Auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<Profile, UserSignUpParams> {

  final AuthRepository authRepository;
  UserSignUp(this.authRepository); 

  @override
  Future<Either<Faliure, Profile>> call(UserSignUpParams params) async {
    return await authRepository.signUp(
      name: params.name, 
      email: params.email, 
      password: params.password,
    );
  }

}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name, 
    required this.email, 
    required this.password,
  });

}