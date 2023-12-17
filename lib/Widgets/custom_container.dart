import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Widget child;
  CustomContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 9,
      ),
      child: child,
    );
  }
}
