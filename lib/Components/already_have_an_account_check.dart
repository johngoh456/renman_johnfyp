import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login=true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        Text(
          login?"Dont Have an Account?":"Already have an Account?",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login?"Sign Up":"Sign in",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),

          ),
        ),

      ],

    );
  }
}