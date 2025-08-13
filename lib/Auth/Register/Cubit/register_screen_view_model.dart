
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Auth/Register/Cubit/statae.dart';


import '../domain/usecase/register_usecase.dart';

class RegisterScreenViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterScreenViewModel(this.registerUseCase) : super(RegisterInitialState());
  var namecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var conformationpasswordcontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var mobilecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  void register() async {
    if (formkey.currentState!.validate() == true) {
      emit(RegisterLoadingState(loadingMassage: 'Loading..'));
      try {
        var response = await registerUseCase.invoke(
            namecontroller.text,
            emailcontroller.text,
            passwordcontroller.text,
            conformationpasswordcontroller.text,
            mobilecontroller.text);
        if (response!.message != 'success') {
          emit(RegisterErrorState(errorMassage: response.message ?? ""));
        } else {
          emit(RegisterSuccessState(response: response));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMassage: e.toString()));
      }
    }
  }
}
