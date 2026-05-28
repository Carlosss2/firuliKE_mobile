import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
  });

  
  factory UserModel.fromJson(Map<String, dynamic> json) {
  return UserModel(
    
    id: json['id'] as int? ?? 0,
    
    email: json['email'] as String? ?? '',
  );
}

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }
}