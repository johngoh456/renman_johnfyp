import 'package:flutter/material.dart';

class display_user_details extends StatelessWidget {
  final String displaytext;
  final String displayinfo;
  const display_user_details({
    Key key,
    this.displaytext,
    this.displayinfo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$displayinfo", style: TextStyle(
          color: Colors.black,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        )),
        SizedBox(width: 20),
        Text('$displaytext',
          style: TextStyle(
            color: Colors.yellow[800],
            letterSpacing: 2,
            fontSize:22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],

    );
  }
}