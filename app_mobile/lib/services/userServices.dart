import 'package:app_mobile/models/user.dart';
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

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      classes: snapshot.data['classes']
    );
  }

  Stream<QuerySnapshot> get classes {
    return userCollection.snapshots();
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }
}
