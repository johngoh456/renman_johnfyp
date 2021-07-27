import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import 'package:renman_johnfyp/Helper/helperfunction.dart';

import '../MyUser.dart';


class AuthService{
final FirebaseAuth _auth=FirebaseAuth.instance;
MyUser _userFromFirebaseUser(User user){
  return user != null ?MyUser(uid: user.uid):null;

}
Stream<MyUser> get user{
  return _auth.authStateChanges()
      .map((User user)=>_userFromFirebaseUser(user));
  // .map(_userFromFirebaseUser);
}
Future registerWithEmailAndPassword(String email, String password)async{
  try{
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    return _userFromFirebaseUser(user);

  }catch(e){
    print(e.toString());
    return null;

  }
}

Future signinWithEmailAndPassword(String email, String password)async{
  try{
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    return _userFromFirebaseUser(user);

  }catch(e){
    print(e.toString());
    return null;

  }
}
Future signout() async{
  try{
    return await _auth.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }

}
void changePassword(String password) {
  User user = _auth.currentUser;
  //Pass in the password to updatePassword.
  user.updatePassword(password).then((_) {
    print("Successfully changed password");
  }).catchError((error) {
    print("Password can't be changed" + error.toString());
    //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
  });
}
//Change Email
  void changeEmail(String email) {
    User user = _auth.currentUser;
    user.updateEmail(email).then((_) {
      print("Successfully changed email");
    }).catchError((error) {
      print("Email can't be changed" + error.toString());
    });
  }
}

//
// Stream<User> get authStateChanges => _auth.idTokenChanges();

// Future<String> login(String email, String password) async{
//   try{
//     await _auth.signInWithEmailAndPassword(email: email, password: password);
//
//     return "Logged in";
//
//   }
//   catch(e){
//     print(e.toString());
//     return e;
//
//   }
// }
// Future<String> signup(String email, String password) async {
//   try{
//     await _auth.createUserWithEmailAndPassword(email: email, password: password);
//
//     return "Signed up";
//   }
//   catch(e){
//     print(e.toString());
//     return e;
//
//   }
// }
// Future signout() async{
//   try{
//     return await _auth.signOut();
//   }catch(e){
//     print(e.toString());
//     return null;
//   }
// }

// Future<bool> verifyCredentials(String password) async {
//   User user = _auth.currentUser;
//
//   //EmailAuthProvider
//   final credential =
//   EmailAuthProvider.credential(email: user.email, password: password);
//   try {
//     final result = await user.reauthenticateWithCredential(credential);
//     return result.user != null;
//   } on FirebaseAuthException catch (e) {
//     print(e.toString());
//     throw e;
//   }
// }

//Change Password
