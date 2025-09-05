part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final Profile user;
  
  AuthSuccess(this.user);
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

final class AuthSignOutSuccess extends AuthState{}
final class AuthSignOutSuccessFailure extends AuthState{
  final String message;

  AuthSignOutSuccessFailure(this.message);
}