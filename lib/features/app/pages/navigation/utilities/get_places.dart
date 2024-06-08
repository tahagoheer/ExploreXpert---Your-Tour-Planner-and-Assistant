import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference hotel =
      FirebaseFirestore.instance.collection('users_hotel');
  final CollectionReference rooms =
      FirebaseFirestore.instance.collection('rooms');

  Future<List<QueryDocumentSnapshot>> getRoomsByCity(String city) async {
    // Getting providers from users_hotel collection with the specified city
    QuerySnapshot usersHotelSnapshot =
        await hotel.where('city', isEqualTo: city).get();

    // Extracting provider names
    List<String> providerNames =
        usersHotelSnapshot.docs.map((doc) => doc['name'] as String).toList();

    if (providerNames.isEmpty) {
      return [];
    }

    // Getting rooms from rooms collection with the specified providers
    QuerySnapshot roomsSnapshot =
        await rooms.where('provider', whereIn: providerNames).get();
    return roomsSnapshot.docs;
  }

  Future<QuerySnapshot> getHotelByPlaceStream(String city) {
    final hotelByPlaceStream = hotel.where('city', isEqualTo: city).get();
    return hotelByPlaceStream;
  }
}
