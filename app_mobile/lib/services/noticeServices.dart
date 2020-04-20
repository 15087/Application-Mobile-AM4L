import 'package:app_mobile/models/notice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:quiver/iterables.dart';

class NoticeService {
  final String uid;
  final String classUid;
  final List<String> classUidList;
  List<DocumentSnapshot> listOfList;
  NoticeService({this.uid, this.classUid, this.classUidList});

  // collection reference
  final CollectionReference noticeCollection =
      Firestore.instance.collection('notices');

  // get notices stream (snapshot)
  Stream<List<Notice>> get notices {
    return noticeCollection.snapshots().map(_noticeListFromSnapshot);
  }

  // convert notices list from snapshot
  List<Notice> _noticeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Notice(
        uid: doc.documentID,
        title: doc.data['title'] ?? '',
        body: doc.data['body'] ?? '',
        classes: doc.data['classes'] ?? [],
      );
    }).toList();
  }

  // user data from snapshots
  Notice _noticeDataFromSnapshot(DocumentSnapshot snapshot) {
    return Notice(
      uid: uid,
      title: snapshot.data['title'],
      body: snapshot.data['body'],
      classes: snapshot.data['classes']
    );
  }

  Future updateNoticeData(String title, String body, List classes) async {
    try {
      return await noticeCollection
          .document(uid)
          .setData({'title': title, 'body': body, 'classes': classes});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // get user doc stream
  Stream<Notice> get noticeData {
    return noticeCollection.document(uid).snapshots()
      .map(_noticeDataFromSnapshot);
  }

}
