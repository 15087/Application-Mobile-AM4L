import 'package:app_mobile/services/auth.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();

//text field state
String email = '';
String password = '';
String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Sign up to School4All'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Sign In')),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter a email please' : null,
                onChanged: (val){
                  setState(() => email = val );
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Enter a valid password please, 6 char. min.' : null,
                obscureText: true, //masque le mdp
                onChanged: (val){
                  setState(() => password = val );

                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue[500],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                  ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if( result == null){
                      setState(() => error = 'please supply a valid email');
                    }
                  }

                }),
                SizedBox(height: 12.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
            ],
          ),
        ),
      ),
    );
  }
}