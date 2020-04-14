import 'package:flutter/material.dart';
import 'package:app_mobile/models/classLabel.dart';

class ClassTile extends StatelessWidget {

  final ClassLabel classe;
  ClassTile({this.classe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          title: Text(classe.uid),
        ),
      ),
      );
  }
}