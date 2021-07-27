import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Components/ShowContactDetails.dart';
import 'package:renman_johnfyp/Components/display_name_widget.dart';
import 'package:renman_johnfyp/Helper/constants.dart';
class ViewContactScreen extends StatelessWidget {
  final String VCname;
  final String VCemail;
  final String VCbankacc;
  final String VCContactno;
  final String VCnotes;

  const ViewContactScreen({this.VCname, this.VCemail, this.VCbankacc, this.VCContactno, this.VCnotes});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
        title: Text(
          "Contact Details",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          display_user_details(
            displayinfo: 'Name:',
            displaytext: VCname,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Divider(
              height:30 ,
              color:  Colors.grey[800],
            ),
          ),

          SizedBox(
            height: 30,
          ),
          ShowContactDetaills(VCemail: VCemail,icon: Icons.mail,),
          ShowContactDetaills(VCemail: VCbankacc, icon: Icons.monetization_on,),
          ShowContactDetaills(VCemail: VCContactno, icon: Icons.phone,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 60),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xFFF5F6F9),),

          child:Row(
            children: [
              Icon(
                  Icons.notes,
                  color: Colors.yellow[800]
              ),
              // Icons.person_outline_outlined
              SizedBox(width: 30),
              Expanded(
                child:
                Text("$VCnotes"),
              ),
            ],
          ),
        ),
      ),

        ],
      ),
    );
  }
}


