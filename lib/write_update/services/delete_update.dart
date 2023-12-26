// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> deleteUpdate(BuildContext context, DateTime dateTime) async {
  try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildProgressIndicator(),
    );

    await FirebaseFirestore.instance
        .collection('updates')
        .where('datetime', isEqualTo: dateTime)
        .get()
        .then((querySnapshot) async {
      for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.delete();
      }
    });

    Navigator.pop(context);

    showSuccessDialog(context);
  } catch (error) {
    print('Error deleting document: $error');
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
      title: const Text('Update Deleted'),
      content: const Text('You have successfully deleted this Update'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
