//Use-Case: business logic of app

import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

//class has method to login
@injectable
class LoginUseCase{

  //use case to work need a repository object
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository}); //constructor injection

  ///func to make register
  Future<Either<Failures, LoginResponseEntity>> invoke(String email, String password){
    return authRepository.login(email, password);
  }
}