import 'package:app_mobile/models/classLabel.dart';
import 'package:app_mobile/screens/home/components/class_list.dart';
import 'package:app_mobile/screens/home/components/notice_list.dart';
import 'package:app_mobile/screens/home/settings_form.dart';
import 'package:app_mobile/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_mobile/models/notice.dart';
import '../../services/classServices.dart';
import '../../services/noticeServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home2 extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // var classesSnap;
    // List<String> classes = ["1A", "1B", "1C"];
    // print("start");
    // for (int i = 0; i < classes.length; i++) {
    //   classesSnap = Firestore.instance
    //       .collection('classes')
    //       .document(classes[i])
    //       .collection('notices')
    //       .snapshots();
    //   if (classesSnap != null) {
    //     classesSnap.forEach((product) {
    //       print("function");
    //       print(product.data.values);
    //     });
    //   }
    // }
    void _showSettingsPanel() {
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
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: _buildBody(context));
  }

  // Widget renderClasses(BuildContext context, List<String> classes) {
  //   return ListView.builder(
  //     itemCount: classes.length,
  //     itemBuilder: (context, index) {
  //       return Padding(
  //         padding: EdgeInsets.all(10.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(classes[index]),
  //             Row(
  //               children: <Widget>[
  //                 Flexible(
  //                   child: PlayerCard(
  //                     player: classes[index]['players'][0],
  //                   ),
  //                 ),
  //                 Flexible(
  //                   child: PlayerCard(
  //                     player: classes[index]['players'][1],
  //                   ),
  //                 ),
  //                 Flexible(
  //                   child: PlayerCard(
  //                     player: classes[index]['players'][2],
  //                   ),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  // Widget _buildColumn(BuildContext context, List<String> classes) {
  //   List<Widget> list = new List<Widget>();
  //   for (var i = 0; i < classes.length; i++) {
  //     list.add(new _buildBody(context, list[i]));
  //   }

  // }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('classes')
            .document('All')
            .collection('notices')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          return _buildList(context, snapshot.data.documents);
        });
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 15.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final notice = Notice.fromSnapshot(data);

    return Padding(
      key: ValueKey(notice.uid),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Container(
        child: ListTile(
          title: Text(notice.title),
          subtitle: Text(notice.body),
          onTap: () => print(notice),
        ),
      ),
    );
  }
}
