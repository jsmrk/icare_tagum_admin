// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> deleteUser(BuildContext context, DateTime dateTime) async {
  // Prompt for confirmation
  bool confirmDeletion = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('This action will permanently delete the update.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false), // Cancel deletion
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pop(context, true), // Proceed with deletion
          child: const Text('Delete'),
        ),
      ],
    ),
  );

  if (confirmDeletion) {
    try {
      // Show progress indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => _buildProgressIndicator(),
      );

      // Perform deletion
      await FirebaseFirestore.instance
          .collection('users')
          .where('datetime', isEqualTo: dateTime)
          .get()
          .then((querySnapshot) async {
        for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
          await documentSnapshot.reference.delete();
        }
      });

      // Dismiss progress indicator and show success message
      Navigator.pop(context);
      showSuccessDialog(context);
    } catch (error) {
      print('Error deleting document: $error');
      // Handle error gracefully, dismiss progress indicator, and inform user
      Navigator.pop(context); // Dismiss progress indicator
      _showErrorDialog(context, error.toString()); // Display error message
    }
  }
}

Widget _buildProgressIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
    ),
  );
}

void _showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(errorMessage),
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
