import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renman_johnfyp/Welcome_Screen/background.dart';
import 'package:renman_johnfyp/Login_Screen/Body_Login.dart';
class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      body: Body_Login(),
    );
  }
}
