import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Components/RoundedButton.dart';
import 'package:renman_johnfyp/Components/already_have_an_account_check.dart';
import 'package:renman_johnfyp/Components/rounded_input_field.dart';
import 'package:renman_johnfyp/Components/rounded_password_field.dart';
import 'package:renman_johnfyp/Firebase_Renman/auth_services.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import 'package:renman_johnfyp/Helper/helperfunction.dart';
import 'package:renman_johnfyp/Login_Screen/LoginScreen.dart';
import 'package:renman_johnfyp/Welcome_Screen/background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body_Signup extends StatefulWidget {
  @override
  _Body_SignupState createState() => _Body_SignupState();
}

class _Body_SignupState extends State<Body_Signup> {
  database dbase= database();
  AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();
  HelperFunction Hfunction= HelperFunction();
  String _useremail;

  String _userpassword;
  String _username;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height*0.10,
              ),
              Text(
                "Register your Renman account here!",
                style: GoogleFonts.architectsDaughter(
                    textStyle: TextStyle(fontSize: 20)
                ),
              ),
              SizedBox(
                height: size.height*0.05,
              ),
              Image.asset(
                "asset/signupimage2.png",
                width: size.width*0.5,
              ),
              RoundedInputField(
                hintText: "Your name",
                onChanged: (value){
                  _username=value;
                },
              ),
              RoundedInputField(
                hintText: "Your email",
                onChanged: (value){
                  _useremail =value;
                },
              ),
              RoundedPasswordField(
              hinttext: "Your Password",
                onChanged: (value){
                  _userpassword =value;
                },
              ),
              RoundedButton(
                width: size.width*0.6,
                text: "Sign Up",
                color: Colors.yellow[500],
                press: ()async{
                  if(_formKey.currentState.validate()){
                    dynamic result= await _auth.registerWithEmailAndPassword(_useremail, _userpassword);
                    User user=FirebaseAuth.instance.currentUser;

                    await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
                      'uid':user.uid,
                      'email': _useremail,
                      'password': _userpassword,
                      "name":  _username,
                    });
                    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){return LoginScreen();},),);
                  }
                }
              ),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: (){Navigator.push(context,MaterialPageRoute(builder:(context){return LoginScreen();},),);},

              ),

            ],
          ),
        ),
      ),
    );
  }
}

// if(_useremail== null){
//   print("Email is empty");
// }else{
//   if(_userpassword== null){
//     print("password is empty");
//   }
//   else{
//     _auth.signup(
//       _useremail,
//       _userpassword,
//     ).then((value) async{
//       // Map<String,String> userInfoMap ={
//       //   "name":  _username,
//       // };
//       // dbase.uploadusername(userInfoMap);
//
//       User user=FirebaseAuth.instance.currentUser;
//
//       await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
//         'uid':user.uid,
//         'email': _useremail,
//         'password': _userpassword,
//         "name":  _username,
//       });
//       print("signup succesfully");
//     });
//
//   }
// }
// // _auth.login(_useremail, _userpassword);