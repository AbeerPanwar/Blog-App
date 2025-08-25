import 'package:blog_app/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthSupabaseSource {
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<String> signIn({required String email, required String password});
}

class AuthSupabaseSourceImpl implements AuthSupabaseSource {
  final SupabaseClient supabaseClient;
  AuthSupabaseSourceImpl(this.supabaseClient);

  @override
  Future<String> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<String> signUp({
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
      return responce.user!.id ;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
