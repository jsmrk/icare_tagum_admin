import 'package:flutter/material.dart';

class LoginTextfield extends StatelessWidget {
  var controller = TextEditingController();
  String hintText;
  IconData icon;
  bool obscure;
  LoginTextfield(
      {required this.icon,
      required this.obscure,
      required this.hintText,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
          size: 21,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.9,
          ),
        ),
      ),
    );
  }
}
