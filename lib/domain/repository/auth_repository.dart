//abstract class and abstract methods
import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class AuthRepository {
  ///register method
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name, String email, String password, String rePassword,
      String phone);

  ///login method
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}