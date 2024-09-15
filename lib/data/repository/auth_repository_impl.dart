import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository{

  //Auth Repository Impl to work need a data source object
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name, String email,
      String password, String rePassword, String phone) async{
    // TODO: implement register
    var either = await authRemoteDataSource.register(name, email, password, rePassword, phone);
    return either.fold(
            (error)=> left(error),
            (response)=> right(response)
    );
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async{
    // TODO: implement logIn
    var either = await authRemoteDataSource.logIn(email, password);
    return either.fold(
            (error)=> left(error),
            (response)=> right(response)
    );
  }

}