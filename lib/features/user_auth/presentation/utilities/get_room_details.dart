import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference room =
      FirebaseFirestore.instance.collection('rooms');
  Future<DocumentSnapshot> getRoomDetailsStream(String roomID) {
    final roomDetailsStream = room.doc(roomID).get();
    return roomDetailsStream;
  }

  final CollectionReference hotel =
      FirebaseFirestore.instance.collection('users_hotel');
  Future<QuerySnapshot> getHotelDetailsStream(String roomProvider) {
    final hotelDetailsStream =
        hotel.where('name', isEqualTo: roomProvider).get();
    return hotelDetailsStream;
  }
}
