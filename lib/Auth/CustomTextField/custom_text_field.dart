
import 'package:flutter/material.dart';

import '../../Theme/my_Theme.dart';

class CustomTextFormField extends StatelessWidget {
  String lable;
  String? Function(String?) validator;
  TextInputType keyboardType;
  TextEditingController controller;
  bool isPassword;
  CustomTextFormField({required this.lable,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        style: TextStyle(
            color: MyTheme.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          filled: true,
          fillColor: MyTheme.white, //
          hintText: lable,
          hintStyle: TextStyle(color: MyTheme.primaryColor, fontSize: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: MyTheme.white,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: MyTheme.white,
              )),
        ),
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
      obscureText: isPassword,
      ),
    );
  }
}
