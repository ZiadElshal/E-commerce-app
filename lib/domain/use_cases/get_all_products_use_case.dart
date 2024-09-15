import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
//class has get all Products
class GetAllProductsUseCase{

  //use case to work need a repository object
  HomeRepository homeRepository;
  GetAllProductsUseCase({required this.homeRepository});

  ///func to get all Products
  Future<Either<Failures, ProductResponseEntity>>invoke(){
    return homeRepository.getAllProducts();
  }
}