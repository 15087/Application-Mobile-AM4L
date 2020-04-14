import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  @override
  Widget build(BuildContext context) {
    final classesSnap = Provider.of<QuerySnapshot>(context);
    final List<String> _classes = [];

    for (var doc in classesSnap.documents) {
      _classes.add(doc.documentID);
    }

    return ListView.builder(
      itemCount: _classes.length,
      itemBuilder: (context, index) {
        return ClassTitle(classe: _classes[index]);
      },
    );
  }
}
