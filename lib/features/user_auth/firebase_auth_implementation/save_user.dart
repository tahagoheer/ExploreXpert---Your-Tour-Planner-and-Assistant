import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> saveUserGoogle(
    GoogleSignInAccount googleSignInAccount, String joinDate) async {
  FirebaseFirestore.instance
      .collection("users_traveler")
      .doc(googleSignInAccount.email)
      .set({
    "email": googleSignInAccount.email,
    "name": googleSignInAccount.displayName,
    "profilepic": googleSignInAccount.photoUrl,
    "provider": "Google",
    "travelies": 0,
    "joindate": joinDate,
  });
}

Future<void> saveUserEmail(User? user, String email, String fullname,
    String password, String joinDate) async {
  FirebaseFirestore.instance.collection("users_traveler").doc(email).set({
    "email": email,
    "name": fullname,
    "profilepic": null,
    "provider": "Email",
    "password": password,
    "travelies": 0,
    "joindate": joinDate,
  });
}
