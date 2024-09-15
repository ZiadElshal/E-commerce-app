//Use-Case: business logic of app

import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

//class has method to register
@injectable
class RegisterUseCase{

  //use case to work need a repository object
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository}); //constructor injection

  ///func to make register
  Future<Either<Failures, RegisterResponseEntity>> invoke(String name, String email, String password, String rePassword,
      String phone){
    return authRepository.register(name, email, password, rePassword, phone);
  }
}