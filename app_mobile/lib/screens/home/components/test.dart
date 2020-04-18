import 'package:app_mobile/models/classLabel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  final List<String> _classLabels = List<String>();

  Widget method2() {
    return Column(
      children: <Widget>[
        Text('You can put other Widgets here'),
        ..._classLabels.map((item) => Text(item)).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
  final classes = Provider.of<List<ClassLabel>>(context);
    for (var clas in classes) {
      _classLabels.add(clas.uid);}
    return Scaffold(
      body: method2()
    );
  }
}

