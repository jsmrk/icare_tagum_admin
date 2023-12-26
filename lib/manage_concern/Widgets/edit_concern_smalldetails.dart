import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmallDetailsText extends StatelessWidget {
  String title;
  String details;
  SmallDetailsText({required this.title, required this.details, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 1.9, bottom: 5),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: details,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
