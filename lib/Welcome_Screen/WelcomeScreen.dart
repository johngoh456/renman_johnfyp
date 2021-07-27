
import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Welcome_Screen/Body.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}
