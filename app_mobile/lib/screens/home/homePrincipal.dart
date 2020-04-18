//import 'package:app_mobile/models/notice.dart';
import 'package:app_mobile/services/auth.dart';
import 'package:app_mobile/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class HomePrincipal extends StatefulWidget {
  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  final _body = TextEditingController();
  final _title = TextEditingController();
  var _classes = List();

  var _checked = List();

  @override
  void dispose() {
    _body.dispose();
    _title.dispose();
    //_classes.dispose();
    super.dispose();
  }

  Iterable<int> range(int low, int high) sync* {
    for (int i = low; i < high; ++i) {
      yield i;
    }
  }

  @override
  void initState() {
    super.initState();
    Firestore.instance.collection('classes').getDocuments().then((snapshot) => {
          for (final i in range(0, snapshot.documents.length))
            {
              _classes.add(snapshot.documents[i].documentID.toString()),
              print(i),
              print(_classes[i]),
            },
        });
  }

  Widget build(BuildContext context) {
    var list = new List<String>.from(_classes);
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
        body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Expanded(
                    child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _title,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Title'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _body,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Description'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          CheckboxGroup(
                              labels: list,
                              onSelected: (List<String> checked) => [
                                    _checked = checked,
                                    print(_checked),
                                    print(checked),
                                  ]),
                        ],
                      ),
                    ),
                  ],
                )),
                RaisedButton(
                  onPressed: () async {
                    print(_checked);
                    var classes = new List<String>.from(_checked);
                    print(classes.toList());
                    var test = {
                      'Title': _title.text,
                      'Description': _body.text,
                      'classes': classes,
                    };

                    if (_formKey.currentState.validate()) {
                      Firestore.instance
                          .collection('notices')
                          .document()
                          .setData(test);

                      Navigator.pop(context);
                      print("mouk en bermuda");
                      print(_checked);
                    }
                  },
                  child: Text("Ajouter"),
                ),
              ]),
            )));
  }
}
