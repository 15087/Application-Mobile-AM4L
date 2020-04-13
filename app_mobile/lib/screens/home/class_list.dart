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

    final classes = Provider.of<QuerySnapshot>(context);

    for (var doc in classes.documents){
      print(doc.data);
    }

    return Container(
      
    );
  }
}