
import 'package:flutter/material.dart';
class ShowContactDetaills extends StatelessWidget {
  const ShowContactDetaills({
    Key key,
    @required this.VCemail, this.icon,

  }) : super(key: key);

  final String VCemail;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xFFF5F6F9),),

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
              Text("$VCemail"),
            ),
          ],
        ),
      ),
    );
  }
}