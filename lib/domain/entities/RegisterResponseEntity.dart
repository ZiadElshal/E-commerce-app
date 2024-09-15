import 'package:e_commerce/data/model/RegisterResponseDM.dart';

/// message : "success"
/// user : {"name":"Ziad","email":"ziad155@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZDIzYjAxNzBhMWU5ZTM3MmE5MWY4NSIsIm5hbWUiOiJaaWFkIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MjUwNTM2OTgsImV4cCI6MTczMjgyOTY5OH0.baJlHG2Dija4Ad3h8MWZZt4OIYwjrvPUFjtsfwlhc_E"

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message,  //=> in success and error msg
      this.user, 
      this.token,
    this.statusMsg  //=> in error msg only
  });

  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;

}

/// name : "Ziad"
/// email : "ziad155@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      });

  String? name;
  String? email;

}