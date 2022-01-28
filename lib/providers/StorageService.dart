import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImage(File image) async {
    String imgUrl;
    Reference ref =
        storage.ref().child("ProductImages/image" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(image);
    await uploadTask.whenComplete(() async {
      String imgUrll = (await ref.getDownloadURL()).toString();
      imgUrl = imgUrll;
    });
    return imgUrl;
  }
}
