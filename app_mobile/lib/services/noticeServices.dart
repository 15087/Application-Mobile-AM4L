import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeService {
  final String uid;
  NoticeService({this.uid});

  // collection reference
  final CollectionReference noticeCollection =
      Firestore.instance.collection('notices');

  Future updateNoticeData(String title, String body) async {
    return await noticeCollection
        .document(uid)
        .setData({'title': title, 'body': body});
  }
}
