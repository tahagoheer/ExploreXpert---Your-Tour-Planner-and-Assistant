import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users_traveler');
  Stream<QuerySnapshot> getUsersStream() {
    final usersStream = users.snapshots();
    return usersStream;
  }
}
