// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class EditButtonIcon extends StatelessWidget {
  final void Function() editConcern;
  IconData icon;
  EditButtonIcon({required this.editConcern, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: editConcern, icon: Icon(icon));
  }
}
