import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_in/cubit/sign_in_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates>{
  //view model to work need a use case object
  LoginUseCase loginUseCase;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginViewModel({required this.loginUseCase})
      :super(LoginInitialState());

  //todo: hold data - handle logic

  ///handle logic not make it
  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text
    );
    either.fold(
            (failures){
          emit(LoginErrorState(failures: failures));
        },
            (response){
          emit(LoginSuccessState(loginResponseEntity: response));
        }
    );
  }
}