import 'package:app_mobile/screens/home/components/notice_list.dart';
import 'package:flutter/material.dart';

class ClassTitle extends StatelessWidget {
  final String classe;
  ClassTitle({this.classe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: NoticeList()
    ,)
      
    );
  }
}