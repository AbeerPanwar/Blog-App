import 'package:blog_app/core/common/entities/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(Profile? user){
    if(user == null) {
      emit(AppUserInitial());
    } else{
      emit(AppUserLoggedIn(user));
    }
  }
}
