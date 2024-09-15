import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api_manager.dart';
import 'package:e_commerce/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce/data/end_points.dart';
import 'package:e_commerce/data/model/LoginResponseDM.dart';
import 'package:e_commerce/data/model/RegisterResponseDM.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{
  //will call Api so return RegisterResponseDto

  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});

  ///register
  @override
  Future<Either<Failures, RegisterResponseDto>> register(
      String name, String email, String password, String rePassword,
      String phone) async {
    // TODO: implement register
    var checkNetworkResult = await Connectivity().checkConnectivity();
    if (checkNetworkResult.contains(ConnectivityResult.wifi) ||
        checkNetworkResult.contains(ConnectivityResult.mobile)){
      ///internet connection
      var response = await apiManager.postData(EndPoints.register,
          body: {
            "name": name,
            "email": email,
            "password": password,
            "rePassword": rePassword,
            "phone": phone
          });

      var registerResponse = RegisterResponseDto.fromJson(response.data);
      ///success case
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        return right(registerResponse);
      }
      ///server error case
      else{
        return left(ServerError(errorMessage: registerResponse.message!));
      }

    }else{
      ///no internet connection
      return left(NetworkError(errorMessage: "No Internet Connection"));
    }


  }

  ///login
  @override
  Future<Either<Failures, LoginResponseDto>> logIn(
      String email, String password) async {
    // TODO: implement logIn
    var checkNetworkResult = await Connectivity().checkConnectivity();
    if (checkNetworkResult.contains(ConnectivityResult.wifi) ||
        checkNetworkResult.contains(ConnectivityResult.mobile)){
      ///internet connection
      var response = await apiManager.postData(EndPoints.login,
          body: {
            "email": email,
            "password": password,
          });

      var loginResponse = LoginResponseDto.fromJson(response.data);
      ///success case
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        return right(loginResponse);
        //we can save token here if we want that
        //SharedPreferenceUtils.saveData(key: "token", value: loginResponse.token);
      }
      ///server error case
      else{
        return left(ServerError(errorMessage: loginResponse.message!));
      }

    }else{
      ///no internet connection
      return left(NetworkError(errorMessage: "No Internet Connection"));
    }
  }

}