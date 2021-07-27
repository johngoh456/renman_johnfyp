import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height:115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
              backgroundImage: null
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              height:46,
              width: 55,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: (){},
                child: Icon(Icons.photo_camera_outlined),
              ),
              ),

            ),

        ],
      ),
      );
  }
}