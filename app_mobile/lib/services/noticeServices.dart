import 'package:app_mobile/models/notice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiver/iterables.dart';

class NoticeService {
  final String uid;
  final String classUid;
  final List<String> classUidList;
  List<DocumentSnapshot> listOfList;
  NoticeService({this.uid, this.classUid, this.classUidList});

  final CollectionReference classCollection =
      Firestore.instance.collection('classes');

    // collection reference
  final CollectionReference noticeCollection =
      Firestore.instance.collection('notices');

  // get notices stream (snapshot)
  Stream<List<Notice>> get notices {
    return Firestore.instance
        .collection('classes')
        .document(classUid)
        .collection('notices')
        .snapshots()
        .map(_noticeListFromSnapshot);
  }

  // convert notices list from snapshot
  List<Notice> _noticeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Notice(
        uid: doc.documentID,
        title: doc.data['title'] ?? '',
        body: doc.data['body'] ?? '',
      );
    }).toList();
  }

  // //with a list of classes
  // List<List<Notice>> getAllNotices(List<String> classes) {
  //   List<CollectionReference> listRefClasses = [];
  //   for (var i in range(0, classes.length)) {
  //     listRefClasses.add(
  //       classCollection.document(classes[i])
  //     );
  //   }
  // }

  Future updateNoticeData(String title, String body) async {
    try {
      return await Firestore.instance
        .collection('classes')
        .document(classUid)
        .collection('notices')
        .document(uid)
        .setData({'title': title, 'body': body});}
   catch (e){   
      print(e.toString());
      return null;
        }
  }
}
