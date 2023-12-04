import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  Future<bool> existUser(String uid) async {
    try {
      // Reference to the users collection in Firestore
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Query the document using the UID
      DocumentSnapshot userData = await users.doc(uid).get();

      // Check if the document exists
      if (userData.exists) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
