
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Auth/Login/Cubit/state.dart';


import '../domain/usecase/login_use_case.dart';

class LoginScreenViewModel  extends Cubit<LoginState> {
 LoginUseCase useCase;
  var formkey=GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
 var mobilecontroller = TextEditingController();
 var namecontroller = TextEditingController();
  LoginScreenViewModel(this.useCase) :super(LoginInitialState());

  void login() async {
    if(formkey.currentState!.validate()==true){
      emit(LoginLoadingState(loadingMassage: 'Loading...'));
      try {
        var response = await useCase.invoke(
            emailcontroller.text,
            passwordcontroller.text

        );

        if (response!.message != 'success') {
          emit(LoginErrorState(errorMassage: response.message ?? "error"));
        } else {
          emit(LoginSuccessState(response: response));
        }
      } catch (e) {
        emit(LoginErrorState(errorMassage: e.toString()));
      }
    }


    }
  }


