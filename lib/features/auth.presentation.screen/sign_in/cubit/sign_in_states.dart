import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

///parent class
abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginErrorState extends LoginStates{
  Failures failures;
  LoginErrorState({required this.failures});
}

class LoginSuccessState extends LoginStates{
  LoginResponseEntity loginResponseEntity;
  LoginSuccessState({required this.loginResponseEntity});
}