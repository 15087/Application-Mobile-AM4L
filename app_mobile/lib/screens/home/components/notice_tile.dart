import 'package:flutter/material.dart';
import 'package:app_mobile/models/notice.dart';

class NoticeTile extends StatelessWidget {
  final Notice notice;
  NoticeTile({this.notice});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.red[600],
            ),
            title: Text(notice.title),
            subtitle: Text(notice.body),
          ),
        ));
  }
}
