import 'package:blog_app/features/Auth/domain/entities/profile.dart';
import 'package:blog_app/features/Auth/domain/use_cases/user_sign_in.dart';
import 'package:blog_app/features/Auth/domain/use_cases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  AuthBloc({required UserSignUp userSignUp, required UserSignIn userSignIn})
    : _userSignUp = userSignUp,
      _userSignIn = userSignIn,
      super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final result = await _userSignUp(
        UserSignUpParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );

      result.fold(
        (faliure) => emit(AuthFailure(faliure.message)),
        (user) => emit(AuthSuccess(user)),
      );
    });
    on<AuthSignIn>((event, emit) async {
      emit(AuthLoading());

      final result = await _userSignIn(
        UserSignInParams(email: event.email, password: event.password),
      );

      result.fold(
        (faliure) => emit(AuthFailure(faliure.message)),
        (user) => emit(AuthSuccess(user)),
      );
    });
  }
}
