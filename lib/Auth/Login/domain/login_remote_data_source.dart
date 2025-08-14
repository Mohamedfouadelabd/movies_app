


import '../../../model/Response/LoginResponse/LoginResponse.dart';

abstract class LoginRemoteDatasource{

  Future<LoginResponse?> login(String email, String password );


}