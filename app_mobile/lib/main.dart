import 'package:app_mobile/screens/wrapper.dart';
import 'package:app_mobile/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_mobile/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value( //on peut utiliser le stream de user dans wrapper mnt
      value: AuthService().user, //quel type de value de stream on veut listen
        child: MaterialApp(
        home: Wrapper(), 
      ),
    );
  }
}

