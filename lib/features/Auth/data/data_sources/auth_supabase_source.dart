import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/features/Auth/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthSupabaseSource {
  Session? get currentSession;
  Future<ProfileModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<ProfileModel> signIn({
    required String email,
    required String password,
  });

  Future<ProfileModel?> getCurrentUserData();
}

class AuthSupabaseSourceImpl implements AuthSupabaseSource {
  final SupabaseClient supabaseClient;
  AuthSupabaseSourceImpl(this.supabaseClient);

  @override
  Session? get currentSession => supabaseClient.auth.currentSession;

  @override
  Future<ProfileModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final responce = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (responce.user == null) {
        throw ServerException('User is null');
      }
      return ProfileModel.fromJson(
        responce.user!.toJson(),
      ).copyWith(email: currentSession!.user.email);
    } catch (e) {
      throw ServerException(e.toString());
    }
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
        data: {'name': name},
      );
      if (responce.user == null) {
        throw ServerException('User is null');
      }
      return ProfileModel.fromJson(
        responce.user!.toJson(),
      ).copyWith(email: currentSession!.user.email);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ProfileModel?> getCurrentUserData() async {
    try {
      if (currentSession != null) {
        final userData = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currentSession!.user.id);
        return ProfileModel.fromJson(
          userData.first,
        ).copyWith(email: currentSession!.user.email);
      }

      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
