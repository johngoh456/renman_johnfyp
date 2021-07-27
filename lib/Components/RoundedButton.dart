import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color,textColor;
  final width;
  const RoundedButton({
    Key key,
    @required
    this.text,
    this.press,
    this.color,
    this.textColor, this.width,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width:width,
      // width: size.width*0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.all(10),
          color: color,
          onPressed: press,
          child: Text(
            text, style: TextStyle(color: textColor),
          ),

        ),
      ),
    );
  }
}