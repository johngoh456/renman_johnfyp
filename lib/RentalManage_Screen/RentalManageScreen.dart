import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import 'package:renman_johnfyp/Helper/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renman_johnfyp/Helper/constants.dart';
import 'package:renman_johnfyp/RentalManage_Screen/AddImportantNotesDetailsScreen.dart';
import 'package:renman_johnfyp/RentalManage_Screen/AddRentailDetails_Screen.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class RentalManageScreen extends StatefulWidget {
  const RentalManageScreen({Key key}) : super(key: key);

  @override
  _RentalManageScreenState createState() => _RentalManageScreenState();
}

class _RentalManageScreenState extends State<RentalManageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top:8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 16,top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Welcome to Renman", style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                      SizedBox(width: 80),
                      // LiteRollingSwitch(
                      //   value: true,
                      //   textOn: "Tenant",
                      //   textOff: "Owner",
                      //   colorOn: Colors.yellow[800],
                      //   colorOff: Colors.yellow[400],
                      //   textSize: 18,
                      //   onChanged: (value){
                      //     bool tenantorowner =value;
                      //     print(tenantorowner);
                      //
                      //   },
                      //
                      //
                      // ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("${Constants.myName}", style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black
                        ),),
                      ),
                      IconButton(icon: Icon(Icons.add), onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddRentalDetailsScreen()));
                      }),
                    ],
                  )

                ],

              ),
            ),
            Container(
              height: 199,
              child: StreamBuilder(
                stream: database().getallrentals(),
                builder: (context,snapshots){
                  if(snapshots.hasData){
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left:16 ,right: 6),
                      itemCount: snapshots.data.docs.length,
                      itemBuilder: (context,index){
                        return Container(
                          margin: EdgeInsets.only(right:10),
                          height: 220,
                          width: 344,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors.yellow[700]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:20, top:13),
                                child: Text(snapshots.data.docs[index]['MonthandYear']+"Rental",
                                  style: TextStyle(fontSize:25),
                                ),
                              ),
                              Divider(
                                indent: 20,
                                endIndent: 80,
                                thickness: 2,
                                color: Colors.black,
                              ),
                              Padding(

                                padding: const EdgeInsets.only(left: 20,top:5),
                                child: Text("Rental Fee: "+ snapshots.data.docs[index]['RentalFee']),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,top:5),
                                child: Text("Electrical Fee:"+ snapshots.data.docs[index]['ElectricalFee']),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,top:5),
                                child: Text("Water bill: " + snapshots.data.docs[index]['WaterFee']),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,top:5),
                                child: Text("Date of paying: "+ snapshots.data.docs[index]['DateofPaying']),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,top:5),

                                child: snapshots.data.docs[index]['Notes']!=null?Text("Notes: "+ snapshots.data.docs[index]['Notes']):Text("Notes:"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }else{
                    return CircularProgressIndicator();
                  }
                }
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:16,bottom: 13,top:29,right:10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        "Important notes",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.add), onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => addimportantnotesdetailsScreen()));
                  })
                ],
              ),
            ),
            StreamBuilder(
              stream: database().getallnotes(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                    padding: EdgeInsets.only(left:16,right:16),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Container(
                      height: 57,
                      margin: EdgeInsets.only(bottom: 13),
                      padding: EdgeInsets.only(left: 24, top:12, bottom: 12,right: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: Offset(10,0),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(snapshot.data.docs[index]['Title'], style: GoogleFonts.inter(
                            fontSize:15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),),
                          Text(snapshot.data.docs[index]['Notes'],style: GoogleFonts.inter(
                            fontSize:10,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),),
                        ],

                      ),

                    );
                  },
                );
                }else{
                  return CircularProgressIndicator();
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}

// Text("Unit: A-05-28", style: GoogleFonts.inter(
// fontSize: 13,
// fontWeight: FontWeight.w500,
// color: Colors.black,
// )),