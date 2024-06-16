import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
User? user = _auth.currentUser;

abstract final class EXCurrentUser {
  static String id = user!.uid.toString();
  static String email = user!.email.toString();
  static String displayName = user!.displayName.toString();
  static String? profilePicture = user!.photoURL;
}
