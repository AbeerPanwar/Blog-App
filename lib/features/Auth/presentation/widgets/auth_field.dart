import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {

  final String hintText;
  final Widget suffixIcon;
  final TextEditingController controller;
  final Widget ?suffixIcon2;
  final bool isPassword;

  const AuthField({
    super.key, 
    required this.hintText, 
    required this.suffixIcon, 
    required this.controller,
    this.suffixIcon2, 
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isObscure = false;
    if(isPassword){
      isObscure = true;
    }
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.white54,
        ),
        suffixIcon: suffixIcon,
      ),
      validator: (value) {
        if(value!.isEmpty){
          return '$hintText is missing';
        }return null;
      },
      obscureText: isObscure ,
      controller: controller,
    );
  }
}