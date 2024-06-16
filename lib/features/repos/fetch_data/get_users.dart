import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/global/toast.dart';

class FireStoreService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users_traveler');
  Stream<QuerySnapshot> getUsersStream() {
    final usersStream = users.snapshots();
    return usersStream;
  }

  Future<DocumentSnapshot> getCurrentUserStream(String cuemail) {
    final currentUserStream = users.doc(cuemail).get();
    return currentUserStream;
  }

  Future<void> updateUserProfile(
      String cuemail, Map<String, dynamic> data) async {
    await users.doc(cuemail).update(data);
    showToast(message: 'Profile Updated Successfully!');
  }
}
