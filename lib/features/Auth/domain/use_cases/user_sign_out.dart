import 'package:blog_app/features/Auth/domain/repositories/auth_repository.dart';

class UserSignOut {
  final AuthRepository authRepository;
  UserSignOut(this.authRepository);

  Future<void> call() async {
    return await authRepository.signOut();
  }
}
