

import '../../../../../model/Response/RegisterResponse/RegisterResponse.dart';

abstract class RegisterRepositoryContract {
  Future<RegisterResponse?> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      );
}
