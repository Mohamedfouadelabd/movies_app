

import '../RegisterResponse/User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MjhlY2JmNWVhZDI1ODQ3YThhMGM1OCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzU0MTQ0OTI2LCJleHAiOjE3NjE5MjA5MjZ9.1Y1ZSZyuR1L4D02goX3ddxC1exuZtR4bhc4dKMs3cI0"

class LoginResponse {
  LoginResponse({
      this.message, 
      this.user, 
      this.token,
  this.statusMsg
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg= json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;
String ?statusMsg;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttti@gmail.com"
/// role : "user"

