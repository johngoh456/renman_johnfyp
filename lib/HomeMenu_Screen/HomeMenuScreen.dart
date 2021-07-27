import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Chat_Screen/ChatScreen.dart';
import 'package:renman_johnfyp/Components/CustomBottomNavigationBar.dart';
import 'package:renman_johnfyp/Contact_Screen/ContactScreen.dart';
import 'package:renman_johnfyp/Firebase_Renman/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:renman_johnfyp/Helper/constants.dart';
import 'package:renman_johnfyp/Helper/helperfunction.dart';
import 'package:renman_johnfyp/Profile_Screen/ProfileScreen.dart';
import 'package:renman_johnfyp/RentalManage_Screen/RentalManageScreen.dart';

class HomeMenuScreen extends StatefulWidget {

  @override
  _HomeMenuScreenState createState() => _HomeMenuScreenState();
}

class _HomeMenuScreenState extends State<HomeMenuScreen> {



  int _selectedpage =0;
  final List pages= [
    RentalManageScreen(),
    ContactScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    getUserInfo();
    // TODO: implement initState
    super.initState();
  }
  getUserInfo() async{
    Constants.myName= await HelperFunction.getuserNameSharePreference();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[_selectedpage],
      bottomNavigationBar: CustomBottomNavigationBar(
        onChange: (val){
          setState(() {
            _selectedpage=val;
          });

        },
        defaultSelectedIndex:0,
      ),

    );
  }
}


