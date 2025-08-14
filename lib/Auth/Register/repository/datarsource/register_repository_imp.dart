

import '../../../../Api/api_manger.dart';
import '../../../../model/Response/RegisterResponse/RegisterResponse.dart';
import '../../domain/repository/repostitory/register_repository_contract.dart';

class RegisterRepositoryImp implements RegisterRepositoryContract {
  ApiManger apiManger;

  RegisterRepositoryImp({required this.apiManger});

  @override
  Future<RegisterResponse?> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      ) {
    return apiManger.register(name, email, password, rePassword, phone);
  }
}

RegisterRepositoryContract injectRegisterRepositoryContract() {
  return RegisterRepositoryImp(apiManger: ApiManger.getApiInstance());
}
