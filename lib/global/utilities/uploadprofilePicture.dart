import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future<String> uploadProfilePicture(String path, XFile img) async {
  try {
    Reference ref = FirebaseStorage.instance.ref(path).child(img.name);
    UploadTask uploadTask = ref.putFile(File(img.path));
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    print("Download URL: $downloadURL");
    return downloadURL;
  } catch (e) {
    print("Error: $e");
    return e.toString();
  }
}
