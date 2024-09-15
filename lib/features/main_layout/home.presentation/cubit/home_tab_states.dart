import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

///parent class
abstract class HomeTabStates{}

class HomeTabInitialState extends HomeTabStates{}

///category states
class HomeCategoriesLoadingState extends HomeTabStates{}
class HomeCategoriesErrorState extends HomeTabStates{
  Failures failures;
  HomeCategoriesErrorState({required this.failures});
}
class HomeCategoriesSuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity categoryResponseEntity;
  HomeCategoriesSuccessState({required this.categoryResponseEntity});
}

///brands states
class HomeBrandsLoadingState extends HomeTabStates{}
class HomeBrandsErrorState extends HomeTabStates{
  Failures failures;
  HomeBrandsErrorState({required this.failures});
}
class HomeBrandsSuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity brandResponseEntity;
  HomeBrandsSuccessState({required this.brandResponseEntity});
}