import 'package:app_mobile/models/notice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeService {
  final String uid;
  final String classUid;
  NoticeService({this.uid, this.classUid});

  // get notices stream (snapshot)
  Stream<List<Notice>> get notices {
    return Firestore.instance
        .collection('classes')
        .document(classUid)
        .collection('notices')
        .snapshots()
        .map(_noticeListFromSnapshot);
  }
  // FIXME: add the following code to the screen code when the list of notices of a particular class is needed
  //   Widget build(BuildContext context) {
  //    return StreamProvider<List<Notice>>.value(
  //     value: NoticeService(classUid : classUid).notices,

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
