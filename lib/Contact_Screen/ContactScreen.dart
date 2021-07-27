import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Contact_Screen/AddContactScreen.dart';
import 'package:renman_johnfyp/Contact_Screen/ViewContactScreen.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({Key key}) : super(key: key);
  @override
  _ContactScreenState createState() => _ContactScreenState();
}
class _ContactScreenState extends State<ContactScreen> {
  QuerySnapshot allcontactdetails;
  var items= <String>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("$allcontactdetails" + "this this this ");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add
            ,color: Colors.white
              ),onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddContactScreen()));

          },
          ),

        ],
        title: Text(
          "Contacts",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: database().getallcontacts(),


              builder: (context,snapshots){
                if(snapshots.hasData){

                   return ListView.builder(
                       itemCount: snapshots.data.docs.length,
                        itemBuilder:(context,index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(
                              builder: (context)=>ViewContactScreen(
                                VCname: snapshots.data.docs[index]['Name'],
                                VCbankacc: snapshots.data.docs[index]['BankAccount'],
                                VCemail: snapshots.data.docs[index]['Email'],
                                VCContactno: snapshots.data.docs[index]['Contact'],
                                VCnotes: snapshots.data.docs[index]['Notes'],

                              )));
                        },
                        child: Card(
                          color: Colors.white,
                        elevation: 1.0,
                        shape:RoundedRectangleBorder(
                            // side: BorderSide( width:1),
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: Container(
                          margin: EdgeInsets.all(9),
                          padding: EdgeInsets.all(6),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Text(snapshots.data.docs[index]['Name'].substring(0,1)),
                                backgroundColor: Color(0xff00695c),
                                foregroundColor: Colors.white,
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Text(
                                snapshots.data.docs[index]['Name'],
                                style: TextStyle(fontSize:20),
                              ),
                            ],
                          ),
                        ),
                  ),
                      );
                });
              }else{
                  return CircularProgressIndicator();
                }
              }

            ),

          ),
        ],

      ),

    );
  }
}
// ListView.builder(
//     itemCount: allcontactdetails.docs.length,
//   shrinkWrap: true,
//   itemBuilder: (context, index) {
//       return Card(
//         elevation: 1.0,
//         shape:RoundedRectangleBorder(
//           side: BorderSide(color: Colors.red, width:1),
//           borderRadius: BorderRadius.circular(18)
//         ),
//         child: Container(
//           margin: EdgeInsets.all(9),
//           padding: EdgeInsets.all(6),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 child: Text('?'),
//                 backgroundColor: Color(0xff00695c),
//                 foregroundColor: Colors.white,
//               ),
//               Padding(padding: EdgeInsets.all(8)),
//               Text(
//                 allcontactdetails.docs[index]["Name"],
//                 style: TextStyle(fontSize:20),
//               ),
//
//
//
//             ],
//           ),
//
//         ),
//       );
//
//   }
// ),

// Container(
//   child: TextField(
//     decoration: InputDecoration(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(25.0))
//       ),
//       prefix: Icon(Icons.search),
//       labelText: "Search",
//
//     ),
//     onChanged: (value){
//
//     },
//   ),
// ),

// initiatelistcontactdetails(){
//   database().getallcontacts().then((value){
//     setState(() {
//       allcontactdetails=value;
//     });
//
//   });
// }
// initiatelistcontactdetails();