import 'package:app_mobile/models/user.dart';
import 'package:app_mobile/services/userServices.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance; //'final' object qui ne changera pas, permettra de faire la co avec la db, underscore: propriété sera privée, utilisé que dans ce fichier

  //Create a user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream, stream = flux, partie dynamique des données. Null qd sign out, user qd sign in/register //stream sera envoyé ds FirebaseUser a chaque changement ds l'authentification
  Stream<User> get user {
    return _auth.onAuthStateChanged // on return onAuthh (stream) dans l'objet _auth
      //.map((FirebaseUser user) => _userFromFirebaseUser(user)); 
      .map(_userFromFirebaseUser); //mm chose que ligne précédente
  }

  //sign in anon
  Future signInAnon() async {
    try{
     AuthResult result = await _auth.signInAnonymously();
     FirebaseUser user = result.user;
     return _userFromFirebaseUser(user);

    } catch(e){
      print(e.toString());
      return null;
      
    }
  }

  //sign in with email and password
    Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;


      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }

  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      await UserService(uid: user.uid).updateUserData(['Null']);
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }

  }

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();

    } catch(e){
      print(e.toString());
      return null;

    }
  }


}