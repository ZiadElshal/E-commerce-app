import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class AuthRemoteDataSource{
  //return RegisterResponseEntity or RegisterResponseDto?
  ///register
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name, String email, String password, String rePassword,
      String phone);

  ///login
  Future<Either<Failures, LoginResponseEntity>> logIn(
      String email, String password);
}