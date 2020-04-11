import 'package:cloud_firestore/cloud_firestore.dart';

class Classes {
  final String id;
  final String name;

  Classes(DocumentSnapshot snapshot)
    : id = snapshot.documentID,
      name = snapshot.data['name'];


  String toString() => "Classes($name)<$id>";
}