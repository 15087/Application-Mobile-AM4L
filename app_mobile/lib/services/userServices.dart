import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final String uid;
  UserService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(List<String> classes) async {
    return await userCollection.document(uid).setData({
      'classes': classes,
    });
  }
}
