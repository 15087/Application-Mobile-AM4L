import 'package:app_mobile/services/auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final AuthService _auth = AuthService();

//text field state
String email = '';
String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Sign in to School4All'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Register')),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val){
                  setState(() => email = val );
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true, //masque le mdp
                onChanged: (val){
                  setState(() => password = val );

                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue[500],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                  ),
                onPressed: (){
                  print(email);
                  print(password);

                }),
            ],
          ),
        ),
      ),
    );
  }
}