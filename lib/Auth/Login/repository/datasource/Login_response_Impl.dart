


import '../../../../model/Response/LoginResponse/LoginResponse.dart';
import '../../domain/Login_response_contract.dart';
import '../../domain/login_remote_data_source.dart';
import 'login_remote_data_source_Iimp.dart';

class LoginResponseImp implements LoginResponseContract{
  LoginRemoteDatasource remoteDatasource;
  LoginResponseImp({required this.remoteDatasource});
  @override
  Future<LoginResponse?> login(String email, String password) {
return remoteDatasource.login(email, password);
  }
}
LoginResponseContract injectLoginResponseContract(){
return LoginResponseImp(remoteDatasource: injectLoginRemoteDatasource());

}