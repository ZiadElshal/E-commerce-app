import 'package:e_commerce/core/resources/app_colors.dart';
import 'package:e_commerce/core/widget/custom_text_form_field.dart';
import 'package:e_commerce/core/widget/dialog_utils.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_up/cubit/sign_up_states.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_up/cubit/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register_screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
  bool isConfirmPasswordVisible = false;

  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel,RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if(state is RegisterLoadingState){
          DialogUtils.showLoading(context: context, message: "loading...");
          
        }else if(state is RegisterErrorState){
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
          
        }else if(state is RegisterSuccessState){
          DialogUtils.hideLoading(context);
          ///in case success
          DialogUtils.showMessage(context: context, message: "Registration Successfully",
              title: Icon(Icons.check_circle_outline_rounded,color: AppColors.greenColor,
                size: 80,),
              posActionName: "Continue",
              posAction: () {
                //Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
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
              iconTheme: IconThemeData(
                color: AppColors.whiteColor
              ),
              title: Text("Create Account",
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

                    CustomTextFormField(
                      label: "User Name",
                      controller: viewModel.nameController,
                    validator: (text){
                      if (text == null || text.trim().isEmpty){
                        return "Please Enter User Name";
                      }
                      return null;
                      },
                    ),
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
                    ///text field for Confirm password
                    CustomTextFormField(
                      label: "Confirm Password",
                      controller:  viewModel.rePasswordController,
                      validator: (text){
                        if (text == null || text.trim().isEmpty){
                          return "Please Enter Confirm Password";
                        }
                        if(text != viewModel.passwordController.text){
                          return "Confirm Password doesn't match Password";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      isConfirmPasswordVisible: true,
                      obscureText: !isConfirmPasswordVisible, // This controls whether the text is visible or not
                      icon: IconButton(
                        onPressed: (){
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                          setState(() {});
                        },
                        icon: Icon(
                          isConfirmPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.labelTextColor,
                          size: 30,
                        ),
                      ),
                    ),
                    ///text field for phone
                    CustomTextFormField(
                      label: "Phone Number",
                      controller:  viewModel.phoneController,
                      validator: (text){
                        return "ok";
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.06,),

                    ElevatedButton(
                        onPressed: (){
                          viewModel.register();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Create Account"),
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
