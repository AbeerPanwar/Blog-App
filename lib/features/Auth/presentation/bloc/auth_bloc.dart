import 'package:blog_app/core/usecase/use_case.dart';
import 'package:blog_app/features/Auth/domain/entities/profile.dart';
import 'package:blog_app/features/Auth/domain/use_cases/current_user.dart';
import 'package:blog_app/features/Auth/domain/use_cases/user_sign_in.dart';
import 'package:blog_app/features/Auth/domain/use_cases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final CurrentUser _currentUser;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required CurrentUser currentUser,
  }) : _userSignUp = userSignUp,
       _userSignIn = userSignIn,
       _currentUser = currentUser,
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
    on<AuthIsUserLoggedIn>((event, emit) async {
      final result = await _currentUser(NoParms());

      result.fold((faliure) => emit(AuthFailure(faliure.message)), (user) {
        emit(AuthSuccess(user));
      });
    });
  }
}
