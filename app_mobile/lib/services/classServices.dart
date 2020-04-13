import 'package:cloud_firestore/cloud_firestore.dart';

class ClassService {
  var _classes = new List();
  
  // collection reference
  final CollectionReference classCollection =
      Firestore.instance.collection('notices');

  Future getAllClasses() async {
    classCollection.getDocuments().then((snapshot) => {
          for (var i = 0; i < snapshot.documents.length; i++)
            {_classes.add(snapshot.documents[i].documentID.toString())}
        });
    return _classes;
  }
}
