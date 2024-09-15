import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/widget/shared_preference_utils.dart';
import 'package:e_commerce/data/api_manager.dart';
import 'package:e_commerce/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:e_commerce/data/end_points.dart';
import 'package:e_commerce/data/model/AddToCartResponseDto.dart';
import 'package:e_commerce/data/model/CategoryOrBrandResponseDM.dart';
import 'package:e_commerce/data/model/ProductResponseDto.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  //will call Api so return RegisterResponseDto

  ApiManager apiManager;
  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllCategories() async{
    // TODO: implement getAllCategories

    var checkNetworkResult = await Connectivity().checkConnectivity();
    if (checkNetworkResult.contains(ConnectivityResult.wifi) ||
        checkNetworkResult.contains(ConnectivityResult.mobile)){
      ///internet connection
      var response = await apiManager.getData(EndPoints.getAllCategories);

      var getAllCategoriesResponse = CategoryOrBrandResponseDto.fromJson(response.data);
      ///success case
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        return right(getAllCategoriesResponse);
      }
      ///server error case
      else{
        return left(ServerError(errorMessage: getAllCategoriesResponse.message!));
      }

    }else{
      ///no internet connection
      return left(NetworkError(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async{
    // TODO: implement getAllBrands

    var checkNetworkResult = await Connectivity().checkConnectivity();
    if (checkNetworkResult.contains(ConnectivityResult.wifi) ||
        checkNetworkResult.contains(ConnectivityResult.mobile)){
      ///internet connection
      var response = await apiManager.getData(EndPoints.getAllBrands);

      var getAllBrandsResponse = CategoryOrBrandResponseDto.fromJson(response.data);
      ///success case
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        return right(getAllBrandsResponse);
      }
      ///server error case
      else{
        return left(ServerError(errorMessage: getAllBrandsResponse.message!));
      }

    }else{
      ///no internet connection
      return left(NetworkError(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDto>> getAllProducts() async{
    // TODO: implement getAllProducts
    var checkNetworkResult = await Connectivity().checkConnectivity();
    if (checkNetworkResult.contains(ConnectivityResult.wifi) ||
        checkNetworkResult.contains(ConnectivityResult.mobile)){
      ///internet connection
      var response = await apiManager.getData(EndPoints.getAllProducts);

      var getAllProductsResponse = ProductResponseDto.fromJson(response.data);
      ///success case
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        return right(getAllProductsResponse);
      }
      ///server error case
      else{
        return left(ServerError(errorMessage: getAllProductsResponse.message!));
      }

    }else{
      ///no internet connection
      return left(NetworkError(errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failures, AddToCartResponseDto>> addToCart(String productId) async{
    // TODO: implement addToCart
    var checkNetworkResult = await Connectivity().checkConnectivity();
    if (checkNetworkResult.contains(ConnectivityResult.wifi) ||
        checkNetworkResult.contains(ConnectivityResult.mobile)){
      ///internet connection
      var token = SharedPreferenceUtils.getData(key: "token");
      var response = await apiManager.postData(EndPoints.addToCart,
      body: {
        "productId": productId
      },
        headers: {
        "token" : token.toString()
        }
      );

      var addToCartResponse = AddToCartResponseDto.fromJson(response.data);
      ///success case
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        return right(addToCartResponse);
      }
      ///server error case
      else{
        return left(ServerError(errorMessage: addToCartResponse.message!));
      }

    }else{
      ///no internet connection
      return left(NetworkError(errorMessage: "No Internet Connection"));
    }
  }

}