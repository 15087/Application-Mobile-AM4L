import 'package:app_mobile/screens/home/homePrincipal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_mobile/models/classLabel.dart';

class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  final List<String> _selectedClasses = List<String>();

  Map<String, bool> someMap = {};

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Add classe(s)'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          HomePrincipal(valuee: _selectedClasses)));
            },
            icon: Icon(Icons.playlist_add),
            color: Colors.blue[20],
            label: Text('Add'),
          )
        ],
      ),
      body: ListView(
        children: someMap.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key),
            value: someMap[key],
            onChanged: (bool value) {
              setState(() {
                _onClassesSelected(value, key);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
