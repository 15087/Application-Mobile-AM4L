import 'package:app_mobile/models/notice.dart';
import 'package:app_mobile/services/auth.dart';
import 'package:app_mobile/services/noticeServices.dart';
import 'package:app_mobile/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:grouped_buttons/grouped_buttons.dart';

class HomePrincipal extends StatefulWidget {
  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {

  final AuthService _auth = AuthService();
  

  //var _check = List();
  final Firestore _db = Firestore.instance;


  String title = '';
  String body = '';


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Notice>>.value(
      value: NoticeService(classUid: "1A").notices,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('School4All - Admin'),
          backgroundColor: Colors.blue[100],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout'))
          ],
        ),
        body: Container(
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Title'),
                  onChanged: (val) {
                    setState(() => title = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Notice', contentPadding: EdgeInsets.all(50.0)),
                  onChanged: (val) {
                    setState(() => body = val);
                  },
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                        color: Colors.blue[500],
                        child: Text(
                          'Create notice',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          return await Firestore.instance
                             .collection('classes')
                             .document('1A')
                             .collection('notices')
                             .setData({
                               'title': title, 
                               'body': body});
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
