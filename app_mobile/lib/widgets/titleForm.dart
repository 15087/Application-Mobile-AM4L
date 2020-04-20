import 'package:flutter/material.dart';
import 'package:app_mobile/shared/constants.dart';

final _title = TextEditingController();

class TitleForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _title,
      decoration: textInputDecoration.copyWith(hintText: 'Title'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a title';
        }
        return null;
      },
    );
  }
}
