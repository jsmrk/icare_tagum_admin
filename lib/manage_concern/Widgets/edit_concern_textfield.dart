import 'package:flutter/material.dart';

class EditConcernTextfield extends StatelessWidget {
  var controller = TextEditingController();
  String label;

  EditConcernTextfield(
      {required this.label, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: label,
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
