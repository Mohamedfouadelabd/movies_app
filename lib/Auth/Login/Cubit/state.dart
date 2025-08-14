

import '../../../model/Response/LoginResponse/LoginResponse.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {
  String? loadingMassage;
  LoginLoadingState({required this.loadingMassage});
}

class LoginErrorState extends LoginState {
  String errorMassage;
  LoginErrorState({required this.errorMassage});
}

class LoginSuccessState extends LoginState {
  LoginResponse? response;
  LoginSuccessState({required this.response});
}
