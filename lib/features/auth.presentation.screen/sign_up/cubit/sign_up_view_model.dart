import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_up/cubit/sign_up_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates>{
  //view model to work need a use case object
  RegisterUseCase registerUseCase;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var phoneController = TextEditingController();
  // var nameController = "Ziad";
  // var emailController = "ziad15@gmail.com";
  // var passwordController = "Ziad@123";
  // var rePasswordController = "Ziad@123";
  // var phoneController = "01010800800";

  RegisterViewModel({required this.registerUseCase})
      :super(RegisterInitialState());

  //todo: hold data - handle logic

  ///handle logic not make it
  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(nameController.text, emailController.text,
        passwordController.text, rePasswordController.text,
        phoneController.text
    );
    either.fold(
        (failures){
          emit(RegisterErrorState(failures: failures));
        },
        (response){
          emit(RegisterSuccessState(registerResponseEntity: response));
        }
    );
  }
}