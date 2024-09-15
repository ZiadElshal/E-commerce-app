import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';

/// message : "success"
/// user : {"name":"Ziad","email":"ziad1556@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZDIzY2M1NzBhMWU5ZTM3MmE5MzRmYiIsIm5hbWUiOiJaaWFkIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MjUwNTQxNDksImV4cCI6MTczMjgzMDE0OX0.ZuBRpbJZYgUviO8xR6ZdSD8xvVbM4KYWN-cG0AZ6d1I"

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
      super.message,
      super.user,
      super.token,
    super.statusMsg
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

}

/// name : "Ziad"
/// email : "ziad1556@gmail.com"
/// role : "user"

class UserDto extends UserEntity{
  UserDto({
      super.name,
      super.email,
      this.role,});

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

}