import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Chat_Screen/SearchScreen.dart';
import 'package:renman_johnfyp/Firebase_Renman/database.dart';
import 'package:renman_johnfyp/Helper/constants.dart';
import 'package:provider/provider.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;

  ConversationScreen(this.chatRoomId);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  database dbase = new database();
  String messagetobesent;
  Stream chatMessagesStream;


  Widget ChatMessageList() {
    return StreamBuilder(

        stream:  dbase.getConversationMessages(widget.chatRoomId),
        builder: (BuildContext  context, snapshot) {
          if(snapshot.hasData) {
            return snapshot.data.docs!= null ? ListView.builder(

                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return  MessageTile(

                    message: snapshot.data.docs[index].data()["message"],
                    sendByMe: Constants.myName ==
                        snapshot.data.docs[index].data()["sendBy"],
                  );
                }) : Container(color: Colors.red[600],);
          }else{
            return CircularProgressIndicator();
          }
        },

    );
  }
  sendMessage() {
    if (messagetobesent.isNotEmpty) {
    Map<String, dynamic> messageMap = {
      "message": messagetobesent,
      "sendBy": Constants.myName,
      'time': DateTime
          .now()
          .millisecondsSinceEpoch,
    };
    dbase.addConversationMessages(widget.chatRoomId, messageMap);
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    // gettargetchatusername();
    //  dbase.getConversationMessages(widget.chatRoomId);
    //      .then((value){
    //   setState(() {
    //     chatMessagesStream = value;
    //     // print(chatMessagesStream);
    //   });
    // });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        title: Text(
            gettargetchatusername(widget.chatRoomId),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            ChatMessageList(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          messagetobesent =value;
                        },

                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Message.......",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: InputBorder.none),
                        ),
                      ),

                    GestureDetector(
                      onTap: (){
                        sendMessage();
                        print("sent");
                      },

                      child: Container(

                        height: 40,
                        width:  40,
                        decoration: BoxDecoration(

                            gradient: LinearGradient(

                                colors: [
                                  Colors.yellow[700],
                                  Colors.yellow[800],
                                ]
                            ),
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,


                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }
}
class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;

  MessageTile({@required this.message, @required this.sendByMe});


  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: sendByMe ? 0 : 24,
          right: sendByMe ? 24 : 0
      ),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          margin: sendByMe
              ? EdgeInsets.only(left: 30)
              : EdgeInsets.only(right: 30),
          padding: EdgeInsets.only(
              top: 17, bottom: 17, left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: sendByMe ? BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(23)
            ) :
            BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomRight: Radius.circular(23)),
            gradient: LinearGradient(
                colors: sendByMe ? [
                Colors.yellow[800],
                Colors.yellow[700]
                ]
                : [
                Colors.white,
            Colors.grey[200]
            ],
          )
      ),
      child: Text(message,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: sendByMe?Colors.white:Colors.black,
              fontSize: 16,
              fontFamily: 'OverpassRegular',
              fontWeight: FontWeight.w300)),
    ),
    );
  }
}
gettargetchatusername(String a){
  return a.split("_").last;


}
// class MessageTile extends StatelessWidget {
//   final String message;
//
//   MessageTile(this.message);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(message),
//     );
//   }
// }


