import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:renman_johnfyp/Helper/constants.dart';

class database {
  FirebaseAuth auth = FirebaseAuth.instance;
  String usercurrentname = Constants.myName;
  String username_contacts = "${Constants.myName}" + "_contacts";
  String username_rentals ="${Constants.myName}" + "_rentals";
  String username_notes ="${Constants.myName}" + "_notes";



  Future<void> userupdateData(String phonenumber,
      String address) async {
    CollectionReference userCollection = FirebaseFirestore.instance.collection(
        "UserDetails");
    String uid = auth.currentUser.uid.toString();
    userCollection.doc(uid).set({
      'phonenumber': phonenumber,
      'address': address,
      'uid': uid
    });
    return;
  }


  Future usergetname() async {
    CollectionReference _collection = FirebaseFirestore.instance.collection(
        'UserDetails');
    DocumentSnapshot snapshot = await _collection.doc(auth.currentUser.uid)
        .get();
    return snapshot.data();
  }

  getuserbyuseremail(String useremail) async {
    return await FirebaseFirestore.instance.collection("users")
        .where("email", isEqualTo: useremail).get();
    // print(result);
  }

  getuserbyusername(String username) async {
    return await FirebaseFirestore.instance.collection("users")
        .where("name", isEqualTo: username).get();
    // print(result);
  }

  uploadusername(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);

    //how to use: ( put inside onpressed/ontap)
    // Map<String,String> userInfoMap ={
    //   "name":  _username,
    // };
    // dbase.uploadusername(userInfoMap);
  }

  createchatroom(String charRoomId, chatRoomMap) {
    FirebaseFirestore.instance.collection("ChatRoom")
        .doc(charRoomId).set(chatRoomMap).catchError((e) {
      print(e.toString());
    });
  }

  addConversationMessages(String chatRoomId, messageMap) {
    FirebaseFirestore.instance.collection("ChatRoom")
        .doc(chatRoomId).
    collection("chats").
    add(messageMap).catchError((e) {
      print(e);
    });
  }

  getConversationMessages(String chatRoomId)  {
    return FirebaseFirestore.instance.collection("ChatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("time", descending: false)
        .snapshots();
  }

  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("ChatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

  addNewContact(String targetcontactId, contactdetailsmap) {
    FirebaseFirestore.instance.collection('ContactDetails').doc(
        '${username_contacts}').collection('ContactList').doc(
        '$targetcontactId').set(contactdetailsmap);
  }

  getallcontacts() {
    return FirebaseFirestore.instance.collection("ContactDetails").doc(
        username_contacts).collection("ContactList").snapshots();
  }
  addNewRental(String targetrentalId, rentaldetailsmap) {
    FirebaseFirestore.instance.collection('RentalDetails').doc(
        '${username_rentals}').collection('RentalList').doc(
        '$targetrentalId').set(rentaldetailsmap);
  }
  getallrentals() {
    return FirebaseFirestore.instance.collection("RentalDetails").doc(
        username_rentals).collection("RentalList").snapshots();
  }
  addNewimportantnotes(String targetnotesId, notedetailsmap) {
    FirebaseFirestore.instance.collection('ImportantNotes').doc(
        '${username_notes}').collection('NotesList').doc(
        '$targetnotesId').set(notedetailsmap);
  }
  getallnotes() {
    return FirebaseFirestore.instance.collection("ImportantNotes").doc(
        username_notes).collection("NotesList").snapshots();
  }

}
// Future<void> userupdateData(String displayname, String phonenumber, String address)async{
//
//   CollectionReference userCollection= FirebaseFirestore.instance.collection("UserDetails");
//   FirebaseAuth auth = FirebaseAuth.instance;
//   String uid=auth.currentUser.uid.toString();
//   userCollection.doc(uid).set({'displayname': displayname,'phonenumber': phonenumber, 'address': address, 'uid': uid});
//   return;
//
// }


// addNewContact(String targetcontactId,contactdetailsmap){
//   FirebaseFirestore.instance.collection("ContactDetails")
//       .doc(username_contacts)
//       .collection("$targetcontactId").add(contactdetailsmap).catchError((e){
//     print(e.toString());
//   });
//
// }
