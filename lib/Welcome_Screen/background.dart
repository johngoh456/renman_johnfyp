import 'package:flutter/material.dart';
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(

      height: size.height,
      width: size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
              top:0,
              right:0 ,
              child: Image.asset(
                "asset/Shape1.png",
                width: size.width*0.3,
              )
          ),
          Positioned(
            bottom:0,
            left: 0,
            child: Image.asset(
              "asset/shape3.png",
              width: size.width*0.3,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
