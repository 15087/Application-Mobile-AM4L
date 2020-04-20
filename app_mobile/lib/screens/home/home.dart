import 'package:app_mobile/widgets/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_mobile/services/auth.dart';
import '../../services/classServices.dart';
import '../../services/noticeServices.dart';

import 'package:app_mobile/models/notice.dart';
import 'package:app_mobile/models/classLabel.dart';


//import 'package:app_mobile/widgets/class_list.dart';
import 'package:app_mobile/widgets/notice_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return StreamProvider<List<ClassLabel>>.value(
              value: ClassService().classes,
              child: Scaffold(
                // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 6.0),
                body: Settings(),
              ),
            );
          });
    }

    return StreamProvider<List<Notice>>.value(
      value: NoticeService().notices,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('School4All'),
          backgroundColor: Colors.blue[100],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout')),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: NoticeList(),
      ),
    );
  }
}
