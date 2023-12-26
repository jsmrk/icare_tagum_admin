import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String userName = ''; // Initialize for potential later use

class GovernmentUpdates {
  Future addUpdate({
    required String title,
    required String description,
    required List<String> imageURLs,
  }) async {
    // Ensure userName is fetched and available
    await fetchUserName();

    await FirebaseFirestore.instance.collection('updates').doc().set({
      'title': title,
      'description': description,
      'datetime': DateTime.now(),
      'imageURL': imageURLs,
      'author': userName, // Use the fetched userName
    });
  }
}

// Isolated function for clarity
Future<void> fetchUserName() async {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  try {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (snapshot.exists && snapshot.data()!['name'] != null) {
      userName = snapshot.data()!['name'];
    } else {
      userName = 'Anonymous'; // Or a placeholder
      print('User name not found in Firestore');
    }
  } catch (error) {
    print('Error fetching user details: $error');
    userName = 'Unknown'; // Or a fallback value
  }
}
