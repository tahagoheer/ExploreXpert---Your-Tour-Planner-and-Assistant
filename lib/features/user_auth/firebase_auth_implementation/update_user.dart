import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateUser(
    String email, newName, newDOB, newGender, newCity, newCountry) async {
  FirebaseFirestore.instance.collection("users_traveler").doc(email).update({
    "name": newName,
    "dob": newDOB,
    "gender": newGender,
    "city": newCity,
    "country": newCountry,
  });
}
