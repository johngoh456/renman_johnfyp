import 'package:flutter/material.dart';
class TextFieldContainer extends StatefulWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _TextFieldContainerState createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 60),
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.yellow[200],
        borderRadius: BorderRadius.circular(29),
      ),
      child: widget.child,

    );
  }
}
