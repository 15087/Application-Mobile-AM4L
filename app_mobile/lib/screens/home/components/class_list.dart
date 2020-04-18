import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_mobile/models/classLabel.dart';


class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  List<String> _classLabels = List<String>();
  List<String> _selectedClasses = List<String>();

  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<List<ClassLabel>>(context);
    for (var clas in classes) {
      _classLabels.add(clas.uid);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: CheckboxGroup(
        labels: _classLabels,
        onSelected: (List<String> selectedClasses) => [ 
                              _selectedClasses=selectedClasses,
                              print(_selectedClasses)],
      ),
    );
  }
}
