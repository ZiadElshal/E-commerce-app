import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
//class has get all categories
class AddToCartUseCase{

  //use case to work need a repository object
  HomeRepository homeRepository;
  AddToCartUseCase({required this.homeRepository});

  ///func to add to cart
  Future<Either<Failures,AddToCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCart(productId);
  }
}