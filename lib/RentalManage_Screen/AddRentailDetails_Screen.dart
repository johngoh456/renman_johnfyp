import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Components/change_userdetails_textfield.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import 'package:renman_johnfyp/Helper/constants.dart';
class AddRentalDetailsScreen extends StatelessWidget {

  String MonthandYear;
  String RentalFee;
  String ElecFee;
  String WaterFee;
  String DateOfPaying;
  String Notes;

  createnewrentaldetails(String dMonthandYear, String dRentalFee, String dElecFee,String dWaterFee,String dDateOfPaying, String dNotes){
      String targetrentalId= createtargetrentalId(Constants.myName, dMonthandYear);
      Map<String,dynamic> rentaldetailsmap={
        "MonthandYear": dMonthandYear,
        "RentalFee": dRentalFee,
        "ElectricalFee": dElecFee,
        "WaterFee": dWaterFee,
        "DateofPaying":dDateOfPaying,
        "Notes": dNotes,

      };
      database().addNewRental(targetrentalId,rentaldetailsmap);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
        title: Text(
          "Add Rental Details ",
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
                height: 20,
              ),
              change_userdetails_textfield(
                labeltext: "Month and Year",
                  placeholder: "December 2000" + "Rental",
                isPasswordTextfield: false,
                onChanged: (value){
                  MonthandYear=value;
                },
              ),

              change_userdetails_textfield(
                labeltext: "Rental Fee",
                placeholder: "RM 2000",
                isPasswordTextfield: false,
                onChanged: (value){
                  RentalFee=value;
                },
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: Row(
                  children: [
                    Icon(Icons.money),
                    Container(
                      width: 120,
                      alignment: Alignment.center,
                      child: Text("Electrical Fee:"),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          ElecFee=value;
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
                      child: Text("Water Bill:"),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          WaterFee=value;
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
                    Icon(Icons.date_range_outlined),
                    Container(
                      width: 120,
                      alignment: Alignment.center,
                      child: Text("Date of Paying:"),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          DateOfPaying=value;
                        },
                      ),
                    ),
                  ],
                ),
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
                    Notes=value;
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
                        createnewrentaldetails(MonthandYear, RentalFee, ElecFee, WaterFee, DateOfPaying, Notes);

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
    );;
  }
}
createtargetrentalId(String a, String b){
  return a +"_rentaldetails_"+ b;
}