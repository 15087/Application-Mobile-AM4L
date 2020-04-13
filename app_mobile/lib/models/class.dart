import 'package:cloud_firestore/cloud_firestore.dart';

class Class {
  final String id;
  final String name;

  Class(DocumentSnapshot snapshot)
    : id = snapshot.documentID,
      name = snapshot.data['name'];


  String toString() => "Classes($name)<$id>";
}