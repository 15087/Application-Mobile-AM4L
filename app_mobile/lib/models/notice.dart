import 'package:cloud_firestore/cloud_firestore.dart';

class Notice {
  final String uid;
  final String title;
  final String body;
  final List classes;

  Notice( {this.uid, this.title, this.body, this.classes});

  Notice.fromSnapshot(DocumentSnapshot snapshot) :
    uid = snapshot.documentID,
    title = snapshot.data['title'],
    body = snapshot.data['body'],
    classes = snapshot.data['classes'];
}