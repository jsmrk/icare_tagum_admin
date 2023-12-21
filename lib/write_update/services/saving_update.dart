import 'package:cloud_firestore/cloud_firestore.dart';

class GovernmentUpdates {
  int _index = 0;

  Future addUpdate({
    required String title,
    required String description,
    required List<String> imageURLs,
  }) async {
    final docUser =
        FirebaseFirestore.instance.collection('updates').doc(_index.toString());

    final json = {
      'title': title,
      'description': description,
      'datetime': DateTime.now(),
      'imageURL': imageURLs,
    };
    await docUser.set(json);
  }
}
