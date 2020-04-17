import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile/models/notice.dart';

class BuildListItem extends StatelessWidget {
  final DocumentSnapshot data;
  BuildListItem({this.data});

  @override
  Widget build(BuildContext context) {
    final notice = Notice.fromSnapshot(data);

    return Padding(
      key: ValueKey(notice.uid),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Container(
        child: ListTile(
          title: Text(notice.title),
          subtitle: Text(notice.body),
          onTap: () => print(notice),
        ),
      ),
    );
  }
}
