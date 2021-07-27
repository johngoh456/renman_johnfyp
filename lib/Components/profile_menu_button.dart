import 'package:flutter/material.dart';

class Profile_Menu extends StatelessWidget {
  const Profile_Menu({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child:Row(
          children: [
            Icon(
                icon,
                color: Colors.yellow[800]
            ),
            // Icons.person_outline_outlined
            SizedBox(width: 30),
            Expanded(
              child:
              Text(text),
            ),
            Icon(Icons.chevron_right_outlined),
          ],
        ),
      ),
    );
  }
}