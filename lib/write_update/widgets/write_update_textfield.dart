import 'package:flutter/material.dart';

class WriteUserTextfield extends StatelessWidget {
  var controller = TextEditingController();
  Text label;

  WriteUserTextfield(
      {required this.label, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        label: label,
        labelStyle: const TextStyle(
            fontFamily: 'Inter',
            color: Color.fromARGB(255, 76, 76, 76),
            fontSize: 15),
        floatingLabelStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 19,
          color: Colors.green,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 126, 126, 126),
            width: 1.9,
          ),
        ),
      ),
    );
  }
}
