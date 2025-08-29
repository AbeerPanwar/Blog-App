import 'package:blog_app/core/error/faliure.dart';
import 'package:blog_app/core/usecase/use_case.dart';
import 'package:blog_app/features/Auth/domain/entities/profile.dart';
import 'package:blog_app/features/Auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<Profile, NoParms> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Faliure, Profile>> call(NoParms params) async {
   return await authRepository.currentUser();
  }
}