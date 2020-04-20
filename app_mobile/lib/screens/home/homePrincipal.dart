import 'package:app_mobile/models/classLabel.dart';
import 'package:app_mobile/services/auth.dart';
import 'package:app_mobile/services/classServices.dart';
import 'package:app_mobile/services/noticeServices.dart';
import 'package:app_mobile/shared/constants.dart';
import 'package:app_mobile/widgets/class_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePrincipal extends StatefulWidget {
  List<String> valuee = List<String>();

  HomePrincipal({Key key, this.valuee}) : super(key: key);

  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  final _body = TextEditingController();
  final _title = TextEditingController();

  List<String> classes = List<String>();

  @override
  void dispose() {
    _body.dispose();
    _title.dispose();
    //_classes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _showAddClassesPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return StreamProvider<List<ClassLabel>>.value(
              value: ClassService().classes,
              child: Scaffold(
                // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 6.0),
                body: ClassList(),
              ),
            );
          });
    }

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
              label: Text('Logout')),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _title,
                    decoration: textInputDecoration.copyWith(hintText: 'Title'),
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
                  RaisedButton(
                      onPressed: () => _showAddClassesPanel(),
                      child: Text('Add class(es)'))
                ],
              )),
              RaisedButton(
                onPressed: () async {
                  var title = _title.text;
                  var body = _body.text;
                  classes = widget.valuee;
                  if (_formKey.currentState.validate()) {
                    print("${widget.valuee}");
                    await NoticeService()
                        .updateNoticeData(title, body, classes);
                    Navigator.pop(context);
                  }
                },
                child: Text("Ajouter"),
              ),
            ]),
          )),
    );
  }
}
