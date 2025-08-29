import 'package:blog_app/core/common/cubit/app_user_cubit/app_user_cubit.dart';
import 'package:blog_app/core/usecase/use_case.dart';
import 'package:blog_app/core/common/entities/profile.dart';
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
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  }) : _userSignUp = userSignUp,
       _userSignIn = userSignIn,
       _currentUser = currentUser,
       _appUserCubit = appUserCubit,
       super(AuthInitial()) {

    on<AuthEvent>((_, emit) => emit(AuthLoading())); 

    on<AuthSignUp>((event, emit) async {
      
      final result = await _userSignUp(
        UserSignUpParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );

      result.fold(
        (faliure) => emit(AuthFailure(faliure.message)),
        (user) => _emitAuthSuccess(user , emit),
      );
    });


    on<AuthSignIn>((event, emit) async {

      final result = await _userSignIn(
        UserSignInParams(email: event.email, password: event.password),
      );

      result.fold(
        (faliure) => emit(AuthFailure(faliure.message)),
        (user) => _emitAuthSuccess(user , emit),
      );
    });


    on<AuthIsUserLoggedIn>((event, emit) async {
      
      final result = await _currentUser(NoParms());

      result.fold(
        (faliure) => emit(AuthFailure(faliure.message)), 
        (user) => _emitAuthSuccess(user , emit),
      );
    });
  }

  void _emitAuthSuccess(Profile user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
