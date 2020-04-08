import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance; //'final' object qui ne changera pas, permettra de faire la co avec la db, underscore: propriété sera privée, utilisé que dans ce fichier

  //sign in anon
  Future signInAnon() async {
    try{
     AuthResult result = await _auth.signInAnonymously();
     FirebaseUser user = result.user;
     return user;

    } catch(e){
      print(e.toString());
      return null;
      
    }
  }

  //sign with email and password

  //register with email & password

  //sign out 


}