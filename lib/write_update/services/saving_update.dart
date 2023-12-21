import 'package:cloud_firestore/cloud_firestore.dart';

class GovernmentUpdates {
  Future addUpdate({
    required String title,
    required String description,
    required List<String> imageURLs,
  }) async {
    await FirebaseFirestore.instance.collection('updates').doc().set({
      'title': title,
      'description': description,
      'datetime': DateTime.now(),
      'imageURL': imageURLs,
    });
  }
}
