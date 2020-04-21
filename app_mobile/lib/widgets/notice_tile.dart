import 'package:flutter/material.dart';
import 'package:app_mobile/models/notice.dart';

class NoticeTile extends StatelessWidget {
  final Notice notice;
  NoticeTile({this.notice});

  // FIXME: not working, check if necessary, find another method to do the same work.
  String _classesToText(List<String> classes) {
    String text;
    if (classes.length == 0) {
      text = "";
    } else if (classes.length < 4) {
      for (var i = 0; i < classes.length; i++) {
        text += classes[i];
        text += " ";
      }
    } else {
      for (var i = 0; i < 4; i++) {
        text += classes[i];
        text += " ";
      }
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: (CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/736x/04/d2/f7/04d2f7b359149455c0f31b3c6baa2f8f.jpg"),
            )),
            title: Text(notice.title),
            subtitle: Text(notice.body),
            // trailing: Text(_classesToText(notice.classes)),
            // trailing: Text(notice.classes.toList().toString()),
            // FIXME: limit the size of the trailing !
            trailing: Text(notice.classes.toString(),
            overflow: TextOverflow.ellipsis,),
          ),
        ));
  }
}
