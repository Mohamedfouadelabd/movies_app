

import '../../../../Api/api_manger.dart';
import '../../../../model/Response/LoginResponse/LoginResponse.dart';
import '../../domain/login_remote_data_source.dart';

class LoginRemoteDatasourceImpl  implements LoginRemoteDatasource{
 ApiManger apiManger;
 LoginRemoteDatasourceImpl({required this.apiManger});
 @override
  Future<LoginResponse?> login(String email, String password) async{
    var response= await apiManger.Login(email, password);
 return response;
  }
}


LoginRemoteDatasource injectLoginRemoteDatasource(){
 return LoginRemoteDatasourceImpl(apiManger: ApiManger.getApiInstance());


}