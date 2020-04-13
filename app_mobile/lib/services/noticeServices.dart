import 'package:app_mobile/models/notice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeService {
  final String uid;
  final String classUid;
  NoticeService({this.uid, this.classUid});

  // get notices stream (snapshot)
  Stream<QuerySnapshot> get notices {
    return Firestore.instance
        .collection('classes')
        .document(classUid)
        .collection('notices')
        .snapshots();
  }

  // convert notices list from snapshot
  List<Notice> _noticeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Notice(
          uid: doc.documentID,
          title: doc.data['title'] ?? '',
          body: doc.data['body'] ?? '');
    }).toList();
  }

  Future updateNoticeData(String title, String body) async {
    return await Firestore.instance
        .collection('classes')
        .document(classUid)
        .collection('notices')
        .document(uid)
        .setData({'title': title, 'body': body});
  }
}
