import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icare_tagum_admin/write_update/models/read_updates_model.dart';

Stream<List<UpdateDetails>> readUpdateDetails() {
  return FirebaseFirestore.instance
      .collection('updates')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            final timestamp = data['datetime'];
            final dateTime = timestamp.toDate();

            final details = UpdateDetails(
                title: data['title'],
                authorName: data['author'],
                description: data['description'],
                imageURLs: data['imageURL'],
                dateTime: dateTime);
            return details;
          }).toList());
}
