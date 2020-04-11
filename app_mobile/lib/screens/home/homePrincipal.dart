import 'package:app_mobile/services/auth.dart';
import 'package:app_mobile/shared/constants.dart';
import 'package:flutter/material.dart';

class HomePrincipal extends StatefulWidget {
  @override
  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  final AuthService _auth = AuthService();

  String title = '';
  String text = '';
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
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
                decoration: textInputDecoration.copyWith(hintText: 'Notice'),
                onChanged: (val) {
                  setState(() => text = val);
                },
              ),
              CheckboxListTile(
                value: value1,
                onChanged: (bool value) {
                  setState(() {
                    value1 = value;
                  });
                },
                title: Text('1A'),
                activeColor: Colors.blue[500],
              ),
              CheckboxListTile(
                value: value2,
                onChanged: (bool value) {
                  setState(() {
                    value2 = value;
                  });
                },
                title: Text('1B'),
                activeColor: Colors.blue[500],
              ),
              RaisedButton(
                  color: Colors.blue[500],
                  child: Text(
                    'Create notice',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {}),
            ],
          ),
        ),
      ),
    );
  }
}
