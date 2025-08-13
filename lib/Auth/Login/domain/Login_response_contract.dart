

import '../../../model/Response/LoginResponse/LoginResponse.dart';

abstract class LoginResponseContract{

  Future<LoginResponse?> login(String email, String password );


}
