import 'package:e_commerce/features/main_layout/cubit/home_states.dart';
import 'package:e_commerce/features/main_layout/favourite.presentation/favourite_tab.dart';
import 'package:e_commerce/features/main_layout/home.presentation/home_tab.dart';
import 'package:e_commerce/features/product_screen.presentation/screens/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel():super(HomeInitialState());

  //todo: hold data - handle logic

  int currentIndex = 0;
  List<Widget> tabs= [
    HomeTab(),
    FavouriteTab(),
    ProductScreen(),
    //ProfileTab(),
  ];

  void changeSelectedIndex(int selectedIndex){
    emit(HomeInitialState());
    currentIndex = selectedIndex;
    emit(ChangeSelectedIndexState());
  }
}