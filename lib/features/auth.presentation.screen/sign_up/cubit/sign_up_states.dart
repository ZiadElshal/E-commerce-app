import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

///parent class
abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterErrorState extends RegisterStates{
  Failures failures;
  RegisterErrorState({required this.failures});
}

class RegisterSuccessState extends RegisterStates{
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}