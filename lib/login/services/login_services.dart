// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:icare_tagum_admin/side_nav/side_nav.dart';

// Future logIn(TextEditingController emailController,
//     TextEditingController passwordController) async {
//   await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: emailController.text.trim(),
//     password: passwordController.text.trim(),
//   );
// }

Future<void> signIn(
  BuildContext context,
  TextEditingController emailController,
  TextEditingController passwordController,
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

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.pop(context); // Hide progress indicator
    const SideNav();
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context); // Hide progress indicator
    showErrorDialog(context, e.message!);
  }
}

Widget _buildProgressIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
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
