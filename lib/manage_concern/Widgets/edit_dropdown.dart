// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class EditConcernDropdown extends StatelessWidget {
  Widget child;
  double width;
  EditConcernDropdown({required this.width, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 31,
        width: width,
        padding: const EdgeInsets.only(left: 9, right: 3, top: 0),
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.rectangle,
          border: Border.all(width: 1, color: Colors.green),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: child);
  }
}
