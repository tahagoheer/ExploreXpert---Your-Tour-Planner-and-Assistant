import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference rooms =
      FirebaseFirestore.instance.collection('rooms');
  Stream<QuerySnapshot> getRoomsStream() {
    final roomsStream = rooms.snapshots();
    return roomsStream;
  }
}
