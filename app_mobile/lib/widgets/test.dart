import 'package:app_mobile/models/classLabel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

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

    return  Scaffold(
      appBar: AppBar(title: Text('Add classe(s)')),
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


