import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Components/Profile_Picture.dart';
import 'package:renman_johnfyp/Components/display_name_widget.dart';
import 'package:renman_johnfyp/Components/profile_menu_button.dart';
import 'package:renman_johnfyp/Firebase_Renman/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:renman_johnfyp/Helper/constants.dart';
import 'package:renman_johnfyp/Helper/helperfunction.dart';
import 'package:renman_johnfyp/Profile_Screen/Profile_YourAccountScreen/YourAccountScreen.dart';
class ProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[800],
        title: Text(
        "Profile",
         style: TextStyle(
             color: Colors.black,
         ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),

          display_user_details(
            displayinfo: 'Name:',
            displaytext: Constants.myName,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Divider(
              height:30 ,
              color:  Colors.grey[800],
            ),
          ),
          // display_user_details(
          //   displayinfo: 'Name:',
          //   displaytext: Constants.myName,
          // ),
          SizedBox(
            height: 100,
          ),
          Profile_Menu(
            text: "Your Account" ,
            icon: Icons.person_outline_outlined,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourAccountScreen()));
            } ,
          ),
          // Profile_Menu(
          //   text: "Settings" ,
          //   icon: Icons.settings_outlined,
          //   press: () {} ,
          // ),
          Profile_Menu(
            text: "Log out " ,
            icon: Icons.directions_run_outlined,
            press: () {
              _auth.signout();
            } ,
          ),
        ],
      ),

    );
  }
}






