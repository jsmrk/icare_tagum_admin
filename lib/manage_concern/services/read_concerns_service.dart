import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/read_concerns_model.dart';

String userRole = '';
String userDepartment = '';

Stream<List<ConcernDetails>> readConcerns() async* {
  await fetchUserDetails(); // Fetch user details first
  yield* readAllConcerns(); // Use yield* to yield values from another stream
}

Stream<List<ConcernDetails>> readAllConcerns() {
  if (userRole == 'Administrator') {
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
  return FirebaseFirestore.instance
      .collection('concerns')
      .where('department', isEqualTo: userDepartment)
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

Future<void> fetchUserDetails() async {
  final userId =
      FirebaseAuth.instance.currentUser!.uid; // Get the current user's UID

  try {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (snapshot.exists) {
      userRole = snapshot.data()!['role'];
      userDepartment = snapshot.data()!['department'];

      print('Role: $userRole, Department: $userDepartment');
    } else {
      print('User document does not exist');
    }
  } catch (error) {
    print('Error fetching user details: $error');
  }
}
