import 'package:app_mobile/models/notice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeService {
  final String uid;
  final String classUid;
  NoticeService({this.uid, this.classUid});

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
          body: doc.data['body'] ?? '');
    }).toList();
  }

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
