import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository{

  //to work need object from HomeRemoteDataSource (abstract)
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() async{
    // TODO: implement getAllCategories
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold(
            (error)=> left(error),
            (response)=> right(response)
    );
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async{
    // TODO: implement getAllBrands
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold(
            (error)=> left(error),
            (response)=> right(response)
    );
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async{
    // TODO: implement getAllProducts
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold(
            (error)=> left(error),
            (response)=> right(response)
    );
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId) async{
    // TODO: implement addToCart
    var either = await homeRemoteDataSource.addToCart(productId);
    return either.fold(
            (error)=> left(error),
            (response)=> right(response)
    );
  }

}