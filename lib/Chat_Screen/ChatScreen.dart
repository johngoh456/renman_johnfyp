import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Chat_Screen/ConversationScreen.dart';
import 'package:renman_johnfyp/Chat_Screen/SearchScreen.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import 'package:renman_johnfyp/Helper/constants.dart';
import 'package:renman_johnfyp/Helper/helperfunction.dart';

class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  database dbase= new database();

  Stream chatRooms;
  @override
  void initState() {

    // TODO: implement initState
    getUserInfogetChats();
    super.initState();
    getUserInfogetChats();
  }
  Widget chatRoomsList() {

    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        if(snapshot.data == null) return CircularProgressIndicator();

        return snapshot.hasData!=null
            ? ListView.builder(
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ChatRoomsTile(
                userName: snapshot.data.docs[index].data()["chatroomid"].toString().replaceAll("_", "").replaceAll(Constants.myName, ""),
                chatRoomId: snapshot.data.docs[index].data()["chatroomid"],
              );
            })
            : Text(snapshot.data.docs.length
        );
      },

    );

  }
//   getUserInfo()async{
//     Constants.myName=await HelperFunction.getuserNameSharePreference();
// }
  getUserInfogetChats() async {
    Constants.myName = await HelperFunction.getuserNameSharePreference();
    dbase.getUserChats(Constants.myName).then((value) {
      setState(() {
        chatRooms = value;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${Constants.myName}");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[800],

        title: Text(
          "ChatRoom",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
          child: chatRoomsList(),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[800],
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=> SearchScreen()));
        },
      ),

    );
  }
}
class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName,@required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ConversationScreen(
              chatRoomId
          ),
        ));
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),

        child: Column(

          children: [

            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(8, 6, 8, 10),
                  height:40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(userName.substring(0, 1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontFamily: 'OverpassRegular',
                          fontWeight: FontWeight.w300)),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(userName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'OverpassRegular',
                        fontWeight: FontWeight.w300))
              ],
            ),
            Divider(
              height:15 ,
              indent: 50,
              color:  Colors.teal[200],
            ),
          ],
        ),
      ),
    );
  }
}
// class ChatRoomTile extends StatelessWidget {
//   final String userName;
//   final String chatRoomId;
//   ChatRoomTile(this.userName, this.chatRoomId);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           Container(),
//           SizedBox(width:8),
//           Text(userName),
//         ],
//       ),
//     );
//   }
// }

//error1 : why red is not showing
//error2: the getter docs was called on null
