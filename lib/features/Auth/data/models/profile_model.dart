import 'package:blog_app/features/Auth/domain/entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required super.id, 
    required super.email, 
    required super.name,
  });

  factory ProfileModel.FromJson(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] ?? '', 
      email: map['email'] ?? '', 
      name: map['name'] ?? '',
    );
  }
}