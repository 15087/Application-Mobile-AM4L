import 'package:app_mobile/models/classLabel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  List<String> _classLabels = List<String>();
  
  Map<String, bool> someMap = {  };


  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<List<ClassLabel>>(context);
    for (var clas in classes) {
      someMap.putIfAbsent(clas.uid, () => false);
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('CheckboxListTile demo')),
      body: new ListView(
        children: someMap.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: someMap[key],
            onChanged: (bool value) {
              setState(() {
                someMap[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}


