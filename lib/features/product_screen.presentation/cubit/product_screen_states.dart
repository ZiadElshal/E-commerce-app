import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class ProductScreenStates{}
class ProductInitialState extends ProductScreenStates{}

class ProductLoadingState extends ProductScreenStates{}

class ProductErrorState extends ProductScreenStates{
  Failures failures;
  ProductErrorState({required this.failures});
}

class ProductSuccessState extends ProductScreenStates{
  ProductResponseEntity productResponseEntity;
  ProductSuccessState({required this.productResponseEntity});
}

///add to cart states
class AddToCartLoadingState extends ProductScreenStates{}

class AddToCartErrorState extends ProductScreenStates{
  Failures failures;
  AddToCartErrorState({required this.failures});
}

class AddToCartSuccessState extends ProductScreenStates{
  AddToCartResponseEntity addToCartResponseEntity;
  AddToCartSuccessState({required this.addToCartResponseEntity});
}
