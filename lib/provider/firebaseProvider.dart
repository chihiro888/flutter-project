import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseProvider {
  // 회원 존재 유무
  Future<bool> existUser(String uid) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      DocumentSnapshot userData = await users.doc(uid).get();

      if (userData.exists) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // 회원가입
  Future<void> createUser(
      String uid,
      String nickname,
      String gender,
      String birth,
      String? mainProfile,
      String? profile1,
      String? profile2,
      String? profile3,
      String? profile4,
      String? profile5) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      await users.doc(uid).set({
        'nickname': nickname,
        'gender': gender,
        'birth': birth,
        'mainProfile': mainProfile,
        'profile1': profile1,
        'profile2': profile2,
        'profile3': profile3,
        'profile4': profile4,
        'profile5': profile5,
        // Add other fields as needed
      });
    } catch (e) {
      // Handle errors here
      print('Error creating user: $e');
      throw e;
    }
  }

// 이미지 등록
  Future<String?> uploadImage(String imagePath) async {
    // try {

    // } catch (e) {
    //   print('Error uploading image: $e');
    //   throw e;
    // }

    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    String extension = imagePath.split('.').last;
    String storagePath = 'profile/$fileName.$extension';

    File imageFile = File(imagePath);

    if (imageFile.existsSync()) {
      Reference storageReference = FirebaseStorage.instance.ref(storagePath);

      // Await the putFile method to ensure it completes before moving on
      await storageReference.putFile(imageFile);

      // After uploading, get the download URL
      String imageUrl = await storageReference.getDownloadURL();

      return imageUrl;
    } else {
      print('Error: 이미지 파일이 존재하지 않습니다.');
      return null;
    }
  }
}
