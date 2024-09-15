// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api_manager.dart' as _i704;
import '../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i384;
import '../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i558;
import '../data/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i404;
import '../data/data_sources/remote_data_source/home_remote_data_source_impl.dart'
    as _i469;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../data/repository/home_repository_impl.dart' as _i723;
import '../domain/repository/auth_repository.dart' as _i306;
import '../domain/repository/home_repository.dart' as _i250;
import '../domain/use_cases/add_to_cart_use_case.dart' as _i994;
import '../domain/use_cases/get_all_brands_use_case.dart' as _i823;
import '../domain/use_cases/get_all_categories_use_case.dart' as _i557;
import '../domain/use_cases/get_all_products_use_case.dart' as _i960;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../features/auth.presentation.screen/sign_in/cubit/sign_in_view_model.dart'
    as _i7;
import '../features/auth.presentation.screen/sign_up/cubit/sign_up_view_model.dart'
    as _i420;
import '../features/main_layout/home.presentation/cubit/home_tab_view_model.dart'
    as _i823;
import '../features/product_screen.presentation/cubit/product_screen_view_model.dart'
    as _i840;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i704.ApiManager>(() => _i704.ApiManager());
    gh.factory<_i404.HomeRemoteDataSource>(() =>
        _i469.HomeRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i384.AuthRemoteDataSource>(() =>
        _i558.AuthRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i306.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i384.AuthRemoteDataSource>()));
    gh.factory<_i250.HomeRepository>(() => _i723.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i404.HomeRemoteDataSource>()));
    gh.factory<_i826.LoginUseCase>(
        () => _i826.LoginUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i772.RegisterUseCase>(() =>
        _i772.RegisterUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i7.LoginViewModel>(
        () => _i7.LoginViewModel(loginUseCase: gh<_i826.LoginUseCase>()));
    gh.factory<_i994.AddToCartUseCase>(() =>
        _i994.AddToCartUseCase(homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i823.GetAllBrandsUseCase>(() =>
        _i823.GetAllBrandsUseCase(homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i557.GetAllCategoriesUseCase>(() =>
        _i557.GetAllCategoriesUseCase(
            homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i960.GetAllProductsUseCase>(() => _i960.GetAllProductsUseCase(
        homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i420.RegisterViewModel>(() =>
        _i420.RegisterViewModel(registerUseCase: gh<_i772.RegisterUseCase>()));
    gh.factory<_i823.HomeTabViewModel>(() => _i823.HomeTabViewModel(
          getAllCategoriesUseCase: gh<_i557.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i823.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i840.ProductScreenViewModel>(() => _i840.ProductScreenViewModel(
          getAllProductsUseCase: gh<_i960.GetAllProductsUseCase>(),
          addToCartUseCase: gh<_i994.AddToCartUseCase>(),
        ));
    return this;
  }
}
