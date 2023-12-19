import 'package:flutter/material.dart';

class AddUserDropdown extends StatelessWidget {
  Widget child;
  AddUserDropdown({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(width: .3),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: child);
  }
}
