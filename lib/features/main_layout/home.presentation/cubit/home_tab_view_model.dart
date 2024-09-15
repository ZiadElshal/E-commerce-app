import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/features/main_layout/cubit/home_states.dart';
import 'package:e_commerce/features/main_layout/home.presentation/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  //view model to work need a use case object
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel({required this.getAllCategoriesUseCase, required this.getAllBrandsUseCase})
      :super(HomeTabInitialState());

  List<CategoryOrBrandEntity> categoryList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  ///func to make object from BlocProvider
  static HomeTabViewModel get(context) => BlocProvider.of(context);

  void getAllCategories() async{
    emit(HomeCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
            (failures){
              emit(HomeCategoriesErrorState(failures: failures));
        },
            (response){
              //should be sure that list is full before emit success case
              categoryList = response.data!;
              emit(HomeCategoriesSuccessState(categoryResponseEntity: response));
        }
    );
  }

  void getAllBrands() async{
    emit(HomeBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold(
            (failures){
          emit(HomeBrandsErrorState(failures: failures));
        },
            (response){
          //should be sure that list is full before emit success case
          brandsList = response.data!;
          emit(HomeBrandsSuccessState(brandResponseEntity: response));
        }
    );
  }

}