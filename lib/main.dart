import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renman_johnfyp/Firebase_Renman/auth_services.dart';
import 'package:renman_johnfyp/Helper/helperfunction.dart';
import 'package:renman_johnfyp/HomeMenu_Screen/HomeMenuScreen.dart';
import 'package:renman_johnfyp/Welcome_Screen/WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:renman_johnfyp/Wrapper.dart';

import 'MyUser.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
          debugShowCheckedModeBanner:false,
        home: wrapper(),
      ),

    );
  }
}



//       (
//       providers: [
//         //user
//         StreamProvider<User>.value(
//           value: AuthService().authStateChanges,
//           initialData: null,),
//       ],
//       child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             scaffoldBackgroundColor: Colors.white,
//           ),
//           home: AuthWrapper(),
//
//
//       ),
//     );
//   }
// }

class AuthWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //context.watch is a function from provide package, the function is to point to firebase authentication user
    final user= context.watch<User>();
    if(user!= null){

      return HomeMenuScreen();
    }
    return WelcomeScreen();
  }
}
