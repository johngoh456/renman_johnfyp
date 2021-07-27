import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renman_johnfyp/HomeMenu_Screen/HomeMenuScreen.dart';
import 'package:renman_johnfyp/Welcome_Screen/WelcomeScreen.dart';

import 'Helper/helperfunction.dart';
import 'MyUser.dart';
class wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    if(user == null){
      return WelcomeScreen();
    }else{
      return HomeMenuScreen();
    }
    //return either home or authenticate widget

  }
}
