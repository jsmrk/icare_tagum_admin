import 'package:flutter/material.dart';

class NavListTile extends StatelessWidget {
  bool selected;
  VoidCallback onTap;
  IconData icon;
  String title;
  NavListTile({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(7),
      duration: const Duration(milliseconds: 101),
      color: selected ? Colors.green : Colors.white,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'Inter'),
        ),
        onTap: onTap,
        selected: selected,
        leading: Icon(
          icon,
          color: selected ? Colors.white : Colors.green,
        ),
        iconColor: Colors.green,
        focusColor: Colors.white,
      ),
    );
  }
}
