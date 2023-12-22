import 'package:flutter/material.dart';

class EditConcernButton extends StatelessWidget {
  void Function()? onTap;
  Color bColor;
  Color tColor;
  IconData icon;
  String buttonName;

  EditConcernButton(
      {required this.bColor,
      required this.tColor,
      required this.icon,
      required this.buttonName,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 37,
          width: 155,
          alignment: Alignment.center,
          color: bColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: tColor,
                size: 21,
              ),
              const SizedBox(width: 7),
              Text(
                buttonName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: tColor,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
