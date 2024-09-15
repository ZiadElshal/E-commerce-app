import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
//class has get all categories
class GetAllCategoriesUseCase{

  //use case to work need a repository object
  HomeRepository homeRepository;
  GetAllCategoriesUseCase({required this.homeRepository});

  ///func to get all categories
  Future<Either<Failures,CategoryOrBrandResponseEntity>>invoke(){
    return homeRepository.getAllCategories();
  }
}