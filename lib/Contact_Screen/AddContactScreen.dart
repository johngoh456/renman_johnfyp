import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Components/change_userdetails_textfield.dart';
import 'package:renman_johnfyp/Contact_Screen/ContactScreen.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import 'package:renman_johnfyp/Helper/constants.dart';
class AddContactScreen extends StatelessWidget {
  String name;
  String email;
  String phonenum;
  String bankacc;
  String notes;
  createnewcontactdetails(String dname, String demail, String dphonenum,String dbankacc,String dnotes){
    if(name !=Constants.myName){
      String targetcontactId= createtargetcontactId(Constants.myName, name);
      Map<String,dynamic> contactdetailsmap={
        "Name": dname,
        "Email": demail,
        "Contact": dphonenum,
        "BankAccount": dbankacc,
        "Notes":dnotes,

      };
      database().addNewContact(targetcontactId,contactdetailsmap);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
        title: Text(
          "New Contact",
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
                labeltext: "Name",
                placeholder: "Dor Alex",
                isPasswordTextfield: false,
                onChanged: (value){
                  name=value;
                },
              ),

              change_userdetails_textfield(
                labeltext: "Phone Number",
                placeholder: "016 666 7777",
                isPasswordTextfield: false,
                onChanged: (value){
                  phonenum=value;
                },
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.email),
                    Container(
                      width: 120,
                      alignment: Alignment.center,
                        child: Text("Email:"),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          email=value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.monetization_on),
                    Container(
                      width: 120,
                      alignment: Alignment.center,
                      child: Text("Bank acc:"),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          bankacc=value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                    ),
                    labelText: "Add Notes",
                  ),
                  onChanged: (value){
                     notes=value;

                  },
                ),
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
                        createnewcontactdetails(name,  email, phonenum, bankacc,notes);

                      },
                      color: Colors.yellow[700],
                      padding: EdgeInsets.symmetric(horizontal: 70),
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Text("Done",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}

createtargetcontactId(String a, String b){
  return a +"_contactdetails_"+ b;
}