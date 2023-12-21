// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signUp(
  BuildContext context,
  TextEditingController emailController,
  TextEditingController passwordController,
  TextEditingController nameController,
  String roleController,
  TextEditingController positionController,
  String departmentController,
) async {
  final String email = emailController.text.trim();
  final String password = passwordController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    showErrorDialog(context, 'Please enter both email and password.');
    return;
  }

  try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildProgressIndicator(),
    );

    final UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final String uid = userCredential.user!.uid;
    addUserDetails(
      uid,
      nameController.text,
      emailController.text,
      roleController,
      positionController.text,
      departmentController,
    );
    Navigator.pop(context);
    showSuccessDialog(context);
    // Navigator.of(context).pushReplacementNamed('/');
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context); // Hide progress indicator
    showErrorDialog(context, e.message!);
  }
}

Future addUserDetails(
  String uid,
  String name,
  String email,
  String role,
  String position,
  String department,
) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).set({
    'uid': uid,
    'name': name,
    'email': email,
    'role': role,
    'position': position,
    'department': department,
    'datetime': DateTime.now(),
  });
}

Widget _buildProgressIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    ),
  );
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Sign Up Successful!'),
      content: const Text('You have successfully created a new account.'),
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

void showFieldValidationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Missing Information'),
      content: const Text('Please enter both email and password to continue.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Sign Up Error'),
      content: Text(errorMessage),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
