import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_mobile/models/notice.dart';

class NoticeList extends StatefulWidget {
  @override
  _NoticeListState createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  @override
  Widget build(BuildContext context) {
    final notices = Provider.of<List<Notice>>(context);
    notices.forEach((notice) {
      print(notice.uid);
      print(notice.title);
      print(notice.body);
    });
    return Container();
  }
}
