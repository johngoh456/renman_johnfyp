import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Components/RoundedButton.dart';
import 'package:renman_johnfyp/Components/already_have_an_account_check.dart';
import 'package:renman_johnfyp/Components/rounded_input_field.dart';
import 'package:renman_johnfyp/Components/rounded_password_field.dart';
import 'package:renman_johnfyp/Components/text_field_container.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import 'package:renman_johnfyp/Helper/helperfunction.dart';
import 'package:renman_johnfyp/HomeMenu_Screen/HomeMenuScreen.dart';
import 'package:renman_johnfyp/SignUp_Screen/SignUpScreen.dart';
import 'package:renman_johnfyp/Welcome_Screen/background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renman_johnfyp/Firebase_Renman/auth_services.dart';
import 'package:provider/provider.dart';

import 'LoginScreen.dart';
class Body_Login extends StatefulWidget {

  @override
  _Body_LoginState createState() => _Body_LoginState();
}

class _Body_LoginState extends State<Body_Login> {

  database dbase = new database();

  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();
  String _useremail;
  String _userpassword;
  QuerySnapshot snapshotUserInfo;
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
                  height: size.height*0.15,
                ),
                Text(
                  "Welcome to Renman, Your Rental Helper!",
                  style: GoogleFonts.architectsDaughter(
                      textStyle: TextStyle(fontSize: 20)
                  ),
                ),
                SizedBox(
                  height: size.height*0.05,
                ),
                Image.asset(
                  "asset/loginpagelogo1.png",
                  width: size.width*0.5,
                ),
                SizedBox(
                  height: size.height*0.01,
                ),
                RoundedInputField(
                  // controller: emailController,
                  hintText: "Your Email",
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
                    text: "log In",
                  color: Colors.yellow[500],
                  press: ()async {
                    if (_formKey.currentState.validate()) {
                      HelperFunction.saveuserEmailInSharedPreference(_useremail);
                      dbase.getuserbyuseremail(_useremail).then((val){
                        snapshotUserInfo=val;
                        HelperFunction.saveuserNameInSharedPreference(snapshotUserInfo.docs[0]["name"]);
                        // print("${snapshotUserInfo.docs[0]["name"]}thisis not good");


                      });
                      dynamic result = await _auth.signinWithEmailAndPassword(
                          _useremail, _userpassword);


                      print("valid");
                      if (result == null) {
                        print("could not sign in with those credentials");
                      }else{
                        Navigator.pop(context);
                        HelperFunction.saveuserLoggedInSharedPreference(true);
                      }
                    }
                  }
                ),
                AlreadyHaveAnAccountCheck(
                  press: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context){
                        return SignUpScreen();
                        },
                    ),
                  );
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
// if(_useremail== null){
//   print("Email is empty");
// }else{
//   if(_userpassword== null){
//     print("password is empty");
//   }
//   else{
//    _auth.login(
//         _useremail,
//         _userpassword,
//     );
//     print("Log in successfully");
//     // Navigator.pushReplacement(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder:(context){
//     //       return HomeMenuScreen();
//     //     },
//     //   ),
//     // );
//
//   }
// }
// // _auth.login(_useremail, _userpassword);
}








