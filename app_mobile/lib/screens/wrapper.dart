import 'package:app_mobile/screens/authenticate/authenticate.dart';
import 'package:app_mobile/screens/home/home.dart';
import 'package:app_mobile/screens/home/homePrincipal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_mobile/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(
        context); //our accessing the user data from the provider, we specify what type de data we need <User>
    print(user);
    //return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else if (user.uid == 'BmVesUmkXEaWTZ9pJqt6DRm98cJ2') {
      return HomePrincipal();
    } else {
      return Home();
    }
  }
}
