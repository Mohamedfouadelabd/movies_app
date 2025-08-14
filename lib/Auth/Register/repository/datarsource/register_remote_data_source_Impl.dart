


import '../../../../Api/api_manger.dart';
import '../../../../model/Response/RegisterResponse/RegisterResponse.dart';
import '../../domain/repository/datasource/register_remote_data_source_contract.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource{
  ApiManger apiManger;
  RegisterRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<RegisterResponse?> register(String name, String email, String password, String rePassword, String phone) async {
var response=await apiManger.register(name, email, password, rePassword, phone);
return response;
  }


}


RegisterRemoteDataSource injectRegisterRemoteDataSource(){
  return RegisterRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());
}