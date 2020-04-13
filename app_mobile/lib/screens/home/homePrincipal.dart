import 'package:app_mobile/services/auth.dart';
import 'package:app_mobile/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class HomePrincipal extends StatefulWidget {
  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  final AuthService _auth = AuthService();
  var _classes = List();
  var _check = List();

  String title = '';
  String body = '';


  @override
  Widget build(BuildContext context) {
    var liste = new List<String>.from(_classes);
    print(liste);
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
                  setState(() => body = val);
                },
              ),
              CheckboxGroup(

                labels: liste,
                onSelected: (List<String> checked) => [ 
                _check=checked,
                print(_check),
                print(checked),
                ]
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
