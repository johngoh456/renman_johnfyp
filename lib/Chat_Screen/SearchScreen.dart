import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Chat_Screen/ConversationScreen.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import 'package:renman_johnfyp/Helper/constants.dart';
import 'package:renman_johnfyp/Helper/helperfunction.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}
String _myName;
class _SearchScreenState extends State<SearchScreen> {
  database dbase = database();
  String Searchuser;
  static QuerySnapshot searchSnapshot;
  bool haveUserSearched = false;

  createchatroomandstartchat(String userName){
    // print("${Constants}");
    // print("Current User Name:" + Constants.myName );
    // print("target chat User Name:" + userName);

    if( userName!=Constants.myName){
      String chatRoomId= createChatRoomId(Constants.myName,userName );
      List<String>users=[Constants.myName, userName];
      Map<String,dynamic> chatRoomMap ={
        "users": users,
        "chatroomid": chatRoomId
      };
      database().createchatroom(chatRoomId, chatRoomMap);
      Navigator.pushReplacement(context,MaterialPageRoute(
          builder: (context)=>ConversationScreen(chatRoomId)
      ));

    }else{
      print("you cannot send message to yourself");

    }


  }
  void initState() {
    getUserInfo();
    print(getUserInfo());
    // TODO: implement initState
    super.initState();
  }



  getUserInfo() async {
    _myName= await HelperFunction.getuserNameSharePreference();
    setState(() {

    });
    // print("${_myName}");
  }
  initiateSearch(){
    dbase.getuserbyusername(Searchuser)
        .then((val){
      setState(() {
        searchSnapshot=val;
      });
    });
  }

  Widget SearchTile({String userName, String userEmail}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName),
              Text(userEmail),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              createchatroomandstartchat( userName

              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow[800],
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Text("Message"),
            ),
          )
        ],
      ),
    );

  }

  Widget searchList(){
    return searchSnapshot!=null?ListView.builder(
      itemCount: searchSnapshot.docs.length,
        shrinkWrap: true,
        itemBuilder:(context,index){
        return SearchTile(
          userName: searchSnapshot.docs[index]["name"],
          userEmail: searchSnapshot.docs[index]["email"],
        );
        }):Container();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[800],
        title: Text(
          "Find Your Friends here",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24,vertical:16),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          onChanged: (value){
                            Searchuser=value;
                          },
                          decoration: InputDecoration(
                            hintText: "Search Username......",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),

                        )
                    ),
                    IconButton(
                        icon: Icon(Icons.search, color: Colors.yellow[800]),
                        onPressed: (){
                          initiateSearch();
                        },
                        ),
                  ],
                ),
              ),
              searchList(),
            ],
          ),
        ),
      ),
    );
  }
}


createChatRoomId(String a, String b){
  if(a.substring(0,1).codeUnitAt(0)>b.substring(0,1).codeUnitAt(0)){
    return"$b\_$a";
  } else{
    return"$a\_$b";
  }
}

// class SearchTile extends StatelessWidget {
//   final String userName;
//   final String userEmail;
//   SearchTile({this.userName,this.userEmail});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(userName),
//               Text(userEmail),
//             ],
//           ),
//           Spacer(),
//           // GestureDetector(
//           //
//           // ),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.yellow[800],
//               borderRadius: BorderRadius.circular(30),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
//             child: Text("Message"),
//           )
//         ],
//       ),
//     );
//   }
// }


