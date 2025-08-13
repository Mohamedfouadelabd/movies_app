

import '../../../../model/Response/LoginResponse/LoginResponse.dart';
import '../../repository/datasource/Login_response_Impl.dart';
import '../Login_response_contract.dart';

class LoginUseCase{
 LoginResponseContract responseContract;
 LoginUseCase ({required this.responseContract});
  Future<LoginResponse?>invoke(String email,String password){

    return responseContract.login(email, password);

  }

}
LoginUseCase ingectLoginUseCase(){

  return LoginUseCase(responseContract: injectLoginResponseContract());
}
