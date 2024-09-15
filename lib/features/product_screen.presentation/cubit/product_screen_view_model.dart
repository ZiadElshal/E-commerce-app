import 'package:e_commerce/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/features/product_screen.presentation/cubit/product_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductScreenViewModel extends Cubit<ProductScreenStates>{
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  ProductScreenViewModel({required this.getAllProductsUseCase,
    required this.addToCartUseCase})
      :super(ProductInitialState());

  //todo: hold data - handle logic

  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;

  static ProductScreenViewModel get(context) => BlocProvider.of(context);

  ///to get all products
  Future<void> getAllProducts()async{
    emit(ProductLoadingState());
    var either =await getAllProductsUseCase.invoke();
    either.fold(
            (failures){
          emit(ProductErrorState(failures: failures));
        },
            (response){
              productsList = response.data!;
          emit(ProductSuccessState(productResponseEntity: response));
        }
    );
  }

  ///to add to cart
  Future<void> addToCart(String productId) async{
    emit(AddToCartLoadingState());
    var either =await addToCartUseCase.invoke(productId);
    either.fold(
            (failures){
          emit(AddToCartErrorState(failures: failures));
        },
            (response){
              numOfCartItems = response.numOfCartItems!.toInt();
              print("num of cart items : $numOfCartItems");
          emit(AddToCartSuccessState(addToCartResponseEntity: response));
        }
    );
  }
}