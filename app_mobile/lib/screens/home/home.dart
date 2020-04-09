import 'package:app_mobile/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            label: Text('Logout'))
        ],
      )
    );
  }
}