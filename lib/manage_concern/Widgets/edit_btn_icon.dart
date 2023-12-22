import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditButtonIcon extends StatelessWidget {
  final void Function() editConcern;
  IconData icon;
  EditButtonIcon({required this.editConcern, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: editConcern, icon: Icon(icon));
  }
}
