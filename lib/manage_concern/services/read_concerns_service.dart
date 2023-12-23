import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icare_tagum_admin/write_update/models/read_updates_model.dart';

import '../models/read_concerns_model.dart';

Stream<List<ConcernDetails>> readConcernDetails() {
  return FirebaseFirestore.instance
      .collection('concerns')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            final timestamp = data['datetime'];
            final dateTime = timestamp.toDate();

            final details = ConcernDetails(
                nickname: data['nickname'],
                location: data['location'],
                title: data['title'],
                dateTime: dateTime,
                description: data['description'],
                urgency: data['urgency'],
                status: data['status'],
                department: data['department'],
                imageURLs: data['imageURL']);
            return details;
          }).toList());
}
