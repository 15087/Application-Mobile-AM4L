import 'package:app_mobile/models/classLabel.dart';
import 'package:app_mobile/models/user.dart';
import 'package:app_mobile/services/userServices.dart';
import 'package:app_mobile/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  List<String> _selectedClasses = List<String>();
  
  Map<String, bool> someMap = {  };
  void _onClassesSelected(bool value, key) {
    if (value == true) {
      setState(() {
        someMap[key] = value;
        _selectedClasses.add(key);
        print(_selectedClasses);
      });
    } else {
      setState(() {
        someMap[key] = value;
        _selectedClasses.remove(key);
        print(_selectedClasses);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<List<ClassLabel>>(context);
    for (var clas in classes) {
      someMap.putIfAbsent(clas.uid, () => false);
    }

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: UserService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return Scaffold(
                  appBar: AppBar(
                    title: Text('Add classe(s)'),
                    actions: <Widget>[
                      FlatButton.icon(
                        onPressed: () async {
                          await UserService(uid: user.uid).updateUserData(
                            _selectedClasses ?? userData.classes
                          );
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.playlist_add),
                        color: Colors.blue[20],
                        label: Text('Update'), )],),
                  body: ListView(
                    children: someMap.keys.map((String key) {
                      return CheckboxListTile(
                        title: Text(key),
                        value: someMap[key] ?? userData.classes,
                        onChanged: (bool value) {
                          setState(() {
                            _onClassesSelected(value, key);
                          });
                        },
                      );
                    }).toList(),
                  ),
                );

        } else{
          return Loading();
        }
        
      }
    );
  }
}


