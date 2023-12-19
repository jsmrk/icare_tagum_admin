import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icare_tagum_admin/manage_users/model/read_user_model.dart';

Stream<List<UserDetails>> readUserDetails() {
  return FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            final timestamp = data['datetime'];
            final dateTime = timestamp.toDate();

            final details = UserDetails(
              role: data['role'],
              name: data['name'],
              email: data['email'],
              position: data['position'],
              department: data['department'],
              dateTime: dateTime,
            );
            return details;
          }).toList());
}
