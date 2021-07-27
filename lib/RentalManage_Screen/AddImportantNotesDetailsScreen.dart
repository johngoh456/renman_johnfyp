import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import 'package:renman_johnfyp/Helper/constants.dart';

class addimportantnotesdetailsScreen extends StatelessWidget {
  String title;
  String importantnotes;

  createnewrentaldetails(String dtitle, String dimportantnotes){
    String targetnotesId= createtargetrentalId(Constants.myName, dtitle);
    Map<String,dynamic> notedetailsmap={
      "Title": dtitle,
      "Notes": dimportantnotes,


    };
    database().addNewimportantnotes(targetnotesId, notedetailsmap);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
        title: Text(
          "Add Important Notes ",
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

              Container(
                margin: EdgeInsets.all(6),
                child: Row(
                  children: [
                    Icon(Icons.title),
                    Container(
                      width: 120,
                      alignment: Alignment.center,
                      child: Text("Title:"),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          title=value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(30, 10, 30,100),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                    ),
                    labelText: "Add Notes",
                  ),
                  onChanged: (value){
                    importantnotes=value;
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
                        createnewrentaldetails(title, importantnotes);

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
createtargetrentalId(String a, String b){
  return a +"_notesdetails_"+ b;
}