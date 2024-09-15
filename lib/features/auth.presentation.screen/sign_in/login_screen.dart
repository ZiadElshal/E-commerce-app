import 'package:e_commerce/core/resources/app_colors.dart';
import 'package:e_commerce/core/widget/custom_text_form_field.dart';
import 'package:e_commerce/core/widget/dialog_utils.dart';
import 'package:e_commerce/core/widget/shared_preference_utils.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_in/cubit/sign_in_states.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_in/cubit/sign_in_view_model.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_up/register_screen.dart';
import 'package:e_commerce/features/main_layout/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController nameController = TextEditingController(text: "Ziad");
  //
  // TextEditingController emailController = TextEditingController(text: "ziad@route.com");
  //
  // TextEditingController passwordController = TextEditingController(text: "123456");
  //
  // TextEditingController confirmPasswordController = TextEditingController(text: "123456");
  //
  // // TextEditingController nameController = TextEditingController();
  // //
  // // TextEditingController emailController = TextEditingController();
  // //
  // // TextEditingController passwordController = TextEditingController();
  // //
  // // TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel,LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if(state is LoginLoadingState){
          DialogUtils.showLoading(context: context, message: "loading...");

        }else if(state is LoginErrorState){
          DialogUtils.hideLoading(context);
          ///in error case
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              title: Icon(Icons.error_outline_rounded,
                color: AppColors.labelTextColor,
                size: 80,),
              posActionName: "Ok",
              buttonColor: AppColors.labelTextColor
          );

        }else if(state is LoginSuccessState){
          DialogUtils.hideLoading(context);
          ///in case success
          DialogUtils.showMessage(context: context, message: "Login Successfully",
              title: Icon(Icons.check_circle_outline_rounded,color: AppColors.greenColor,
                size: 80,),
              posActionName: "Continue",
              posAction: () {
                //todo: save token
                SharedPreferenceUtils.saveData(key: "token", value: state.loginResponseEntity.token);
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              },
              buttonColor: AppColors.greenColor
          );

        }
      },
      child: Stack(
        children: [
          Container(
            color: AppColors.whiteColor,
            child: Image.asset("assets/images/main_background.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Login",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.whiteColor
                ),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),

            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.28,),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text("Welcome back!",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: 24,
                                color: AppColors.blackColor
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                    ///email
                    CustomTextFormField(
                      label: "E-mail Address",
                      controller:  viewModel.emailController,
                      validator: (text){
                        if (text == null || text.trim().isEmpty){
                          return "Please Enter E-mail Address";
                        }
                        final bool emailValid =
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if(!emailValid){
                          return "Please Enter Valid E-mail";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),

                    ///text field for password
                    CustomTextFormField(
                      label: "Password",
                      controller:  viewModel.passwordController,
                      validator: (text){
                        if (text == null || text.trim().isEmpty){
                          return "Please Enter Password";
                        }
                        if(text.length < 6){
                          return "Password should be at least 6 chars";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      isPasswordVisible: true,
                      obscureText: !isPasswordVisible, // This controls whether the text is visible or not
                      icon: IconButton(
                        onPressed: (){
                          isPasswordVisible = !isPasswordVisible;
                          setState(() {});
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.labelTextColor,
                          size: 30,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text("Forgot password?",
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.09,),

                    ElevatedButton(
                      onPressed: (){
                        viewModel.login();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Login"),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.authPrimaryColor,
                        foregroundColor: AppColors.whiteColor,
                        //fixedSize: Size(350, 65),
                        fixedSize: Size(
                          MediaQuery.of(context).size.width*0.9,
                          MediaQuery.of(context).size.height*0.08,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        // shadowColor: AppColors.whiteColor
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.06,),

                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(RegisterScreen.routeName);
                        },
                        child: Text("Or Create My Account",
                            style: Theme.of(context).textTheme.titleSmall
                        )
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
