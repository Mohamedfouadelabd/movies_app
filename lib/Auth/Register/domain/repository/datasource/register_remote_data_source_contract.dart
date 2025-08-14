


import '../../../../../model/Response/RegisterResponse/RegisterResponse.dart';

abstract class RegisterRemoteDataSource{
  Future<RegisterResponse?> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      );

}