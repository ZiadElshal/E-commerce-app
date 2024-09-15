import 'package:e_commerce/core/my_block_observer.dart';
import 'package:e_commerce/core/widget/shared_preference_utils.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_in/login_screen.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_up/register_screen.dart';
import 'package:e_commerce/features/main_layout/favourite.presentation/favourite_tab.dart';
import 'package:e_commerce/features/main_layout/home.presentation/home_tab.dart';
import 'package:e_commerce/features/main_layout/home_screen.dart';
import 'package:e_commerce/features/product_screen.presentation/cubit/product_screen_view_model.dart';
import 'package:e_commerce/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'di/di.dart';
import 'features/cart/screens/cart_screen.dart';
import 'features/main_layout/home.presentation/cubit/home_tab_view_model.dart';
import 'features/product_screen.presentation/product_details.dart';
import 'features/product_screen.presentation/screens/product_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: "token");
  String route;
  if(token == null){
    route = LoginScreen.routeName;
  }else{
    route = HomeScreen.routeName;
  }

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeTabViewModel>()),
        BlocProvider(create: (context) => getIt<ProductScreenViewModel>()),
      ],
  child: MyApp(route: route,)
  )
  );
}

class MyApp extends StatelessWidget {
  String route;
  MyApp({required this.route});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: route,
      routes: {
        SplashScreen.routeName : (context) => SplashScreen(),
        LoginScreen.routeName : (context) => LoginScreen(),
        RegisterScreen.routeName : (context) => RegisterScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        HomeTab.routeName : (context) => HomeTab(),
        FavouriteTab.routeName : (context) => FavouriteTab(),
        ProductScreen.routeName : (context) => ProductScreen(),
        ProductDetails.routeName : (context) => ProductDetails(),
        CartScreen.routeName : (context) => CartScreen(),

      },
    );
    //   ScreenUtilInit(
    //   designSize: const Size(430, 932),
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    //   builder: (context, child) => MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     initialRoute: SplashScreen.routeName,
    //     routes: {
    //       SplashScreen.routeName : (context) => SplashScreen(),
    //       RegisterScreen.routeName : (context) => RegisterScreen(),
    //     },
    //   ),
    // );
  }
}
