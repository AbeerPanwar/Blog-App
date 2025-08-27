import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/features/Auth/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthSupabaseSource {
  Future<ProfileModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<ProfileModel> signIn({
    required String email, 
    required String password,
  });
}

class AuthSupabaseSourceImpl implements AuthSupabaseSource {
  final SupabaseClient supabaseClient;
  AuthSupabaseSourceImpl(this.supabaseClient);

  @override
  Future<ProfileModel> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final responce = await supabaseClient.auth.signUp(
        password: password, 
        email: email,
        data: {
          'name' : name,
        }
      );
      if(responce.user == null){
        throw ServerException('User is null');
      }
      return ProfileModel.FromJson(responce.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
