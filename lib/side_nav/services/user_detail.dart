import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void getUserDetails(
  Function(Map<String, dynamic>) onUserDetails,
  Function(String) onError,
) {
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user != null) {
      final uid = user.uid;
      final userDocument =
          FirebaseFirestore.instance.collection('users').doc(uid).get();
      userDocument.then((snapshot) {
        if (snapshot.exists) {
          final userData = snapshot.data();
          if (userData != null) {
            onUserDetails(userData);
          } else {
            onError('User document data is null');
          }
        } else {
          onError('User document not found');
        }
      });
    } else {
      // handle scenario where user is not logged in
    }
  });
}
