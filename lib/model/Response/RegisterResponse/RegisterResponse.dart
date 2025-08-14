import 'Error.dart';
import 'User.dart';

class RegisterResponse {
  String? message;
  User? user;
  String? token;
  String? statusMsg;
  ApiError? error;

  RegisterResponse({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
    this.error,
  });

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];


    error = json['errors'] != null ? ApiError.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    map['token'] = token;
    if (error != null) {
      map['errors'] = error!.toJson();
    }
    return map;
  }
}
