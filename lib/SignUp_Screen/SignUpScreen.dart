import 'package:flutter/material.dart';
import 'package:renman_johnfyp/SignUp_Screen/Body_Signup.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      body: Body_Signup(),
    );
  }
}
