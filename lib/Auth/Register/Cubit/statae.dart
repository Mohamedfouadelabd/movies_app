

import '../../../model/Response/RegisterResponse/RegisterResponse.dart';

abstract class RegisterState{}
class RegisterLoadingState extends RegisterState{
  String ?loadingMassage;
  RegisterLoadingState({ required this.loadingMassage});
}
class RegisterErrorState extends RegisterState{
  String ?errorMassage;
  RegisterErrorState({required this.errorMassage});
}
class RegisterSuccessState extends RegisterState{
  RegisterResponse ?response;
  RegisterSuccessState({required this.response});
}
class RegisterInitialState extends RegisterState{

}