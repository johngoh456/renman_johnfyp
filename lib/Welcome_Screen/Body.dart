import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Components/RoundedButton.dart';
import 'package:renman_johnfyp/Login_Screen/LoginScreen.dart';
import 'package:renman_johnfyp/SignUp_Screen/SignUpScreen.dart';
import 'package:renman_johnfyp/Welcome_Screen/background.dart';
import 'package:google_fonts/google_fonts.dart';
class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height*0.15,
              width: size.width,
            ),
             Text(
                  "Log in to Renman, Your Rental Helper!",
                style: GoogleFonts.architectsDaughter(
                    textStyle: TextStyle(fontSize: 20)
                ),
              ),
             SizedBox(
               height: size.height*0.05,
             ),
             Image.asset(
                  "asset/loginpagelogo1.png",
                  width: size.width*0.7,
              ),
            SizedBox(
              height: size.height*0.05,
            ),
            RoundedButton(
              color: Colors.yellow[500],
              width: size.width*0.8,
                text:"Log In",
                press: (){
                Navigator.push(
                  context,MaterialPageRoute(builder:(context){return LoginScreen();},),);},
            ),
            RoundedButton(
              width: size.width*0.8,
              color: Colors.yellow[200],
              text:"Sign Up",
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
    );
  }
}



