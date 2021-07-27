import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Components/CustomBottomNavigationBar.dart';
import 'package:renman_johnfyp/Components/Profile_Picture.dart';
import 'package:renman_johnfyp/Components/change_userdetails_textfield.dart';
import 'package:renman_johnfyp/Components/profile_menu_button.dart';
import 'package:renman_johnfyp/Firebase_Renman/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import '../ProfileScreen.dart';
import 'package:provider/provider.dart';


class YourAccountScreen extends StatefulWidget {
  const YourAccountScreen({Key key}) : super(key: key);

  @override
  _YourAccountScreenState createState() => _YourAccountScreenState();
}

class _YourAccountScreenState extends State<YourAccountScreen> {
  database dbase = database();
  AuthService _auth = AuthService();
  FirebaseAuth auth= FirebaseAuth.instance;
  bool showpassword=false;
  String _userupdatename;
  String _userupdateemail;
  String _userupdatephoneno;
  String _userupdateaddress;
  String _userupdatepassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Your Account",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16,top: 25, right: 16),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              change_userdetails_textfield(
                labeltext: "Email",
                placeholder: "doralex@hello.com",
                isPasswordTextfield: false,
                onChanged: (value){
                  _userupdateemail=value;
                },
              ),
              change_userdetails_textfield(
                labeltext: "Phone Number",
                placeholder: "016 666 7777",
                isPasswordTextfield: false,
                onChanged: (value){
                  _userupdatephoneno=value;
                },
              ),
              change_userdetails_textfield(
                labeltext: "Address",
                placeholder: "ipoh, kuala lumpur, 56000, Malaysia",
                isPasswordTextfield: false,
                onChanged: (value){
                  _userupdateaddress=value;
                },
              ),


              change_userdetails_textfield(
                labeltext: "Password",
                placeholder: "xxxxxxxx",
                isPasswordTextfield: true,
                onChanged: (value){
                  _userupdatepassword=value;
                },
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal:60),
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child:Text("Cancel",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.black
                    ),),

                  ),
                  RaisedButton(
                    onPressed:(){
                      dbase.userupdateData( _userupdatephoneno, _userupdateaddress);
                      _auth.changePassword(_userupdatepassword);
                      FirebaseFirestore.instance.collection("users").doc(auth.currentUser.uid).update({ 'email' : _userupdateemail, 'password' : _userupdatepassword });
                      _auth.changeEmail(_userupdateemail);

                      },
                    color: Colors.yellow[800],
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Text("Save",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white
                      ),
                    ),
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}


