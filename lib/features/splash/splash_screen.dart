import 'dart:async';

import 'package:e_commerce/features/auth.presentation.screen/sign_in/login_screen.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_up/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), (){
      Navigator.pushNamed(context, LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset("assets/images/splash_screen.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      ),

    );
  }
}
