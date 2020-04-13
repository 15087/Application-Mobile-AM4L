import 'package:cloud_firestore/cloud_firestore.dart';

class ClassService {
  var _classes = new List();

  // collection reference
  final CollectionReference classCollection =
      Firestore.instance.collection('classes');

  Future getAllClasses() async {
    QuerySnapshot query = await classCollection.getDocuments();
    this._classes = query.documents;
    print(_classes);
    return this._classes;
  }
}
