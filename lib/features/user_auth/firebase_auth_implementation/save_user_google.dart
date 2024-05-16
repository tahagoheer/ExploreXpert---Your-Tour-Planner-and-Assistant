import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> saveUserGoogle(GoogleSignInAccount googleSignInAccount) async {
  FirebaseFirestore.instance
      .collection("users_traveler")
      .doc(googleSignInAccount.email)
      .set({
    "email": googleSignInAccount.email,
    "name": googleSignInAccount.displayName,
    "profilepic": googleSignInAccount.photoUrl,
    "provider": "Google",
  });
}
