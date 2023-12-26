// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> saveUpdatedConcern(
  BuildContext context,
  String? selectedDepartment,
  DateTime dateTime,
) async {
  try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildProgressIndicator(),
    );

    await FirebaseFirestore.instance
        .collection('concerns')
        .where('datetime', isEqualTo: dateTime)
        .get()
        .then((querySnapshot) async {
      for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.update({
          'status': 'Viewed',
          'department': selectedDepartment,
          'dateupdated': FieldValue.serverTimestamp(),
        });
      }
    });

    Navigator.pop(context);

    showSuccessDialog(context);
  } catch (error) {
    print('Error updating document: $error');
  }
}

Widget _buildProgressIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
    ),
  );
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Concern Updated'),
      content: const Text('You have successfully updated this Concern'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
