import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateUser(String email, String newName, String newDOB,
    String newGender, String newCity, String newCountry, newProfilepic) async {
  FirebaseFirestore.instance.collection("users_traveler").doc(email).update({
    "name": newName,
    "dob": newDOB,
    "gender": newGender,
    "city": newCity,
    "country": newCountry,
    "profilepic": newProfilepic,
  });
}
