import 'package:flutter/material.dart';

class change_userdetails_textfield extends StatefulWidget {
  final String labeltext;
  final String placeholder;
  final bool isPasswordTextfield;
  final ValueChanged<String> onChanged;
  const change_userdetails_textfield({
    Key key,
    this.labeltext,
    this.placeholder,
    this.isPasswordTextfield, this.onChanged,

  }) : super(key: key);

  @override
  _change_userdetails_textfieldState createState() => _change_userdetails_textfieldState();
}

class _change_userdetails_textfieldState extends State<change_userdetails_textfield> {
  bool showpassword=false;
  void _togglepasswordview(){
    if(showpassword ==true){
      showpassword=false;
    }else{
      showpassword=true;
    }
    setState((){});
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 27),
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: showpassword,

        decoration: InputDecoration(

            suffixIcon: widget.isPasswordTextfield?IconButton(
              onPressed: _togglepasswordview,
              icon: showpassword?Icon(Icons.visibility_off):Icon(Icons.visibility),
            ):null,
            contentPadding: EdgeInsets.only(bottom: 3 ),
            labelText: widget.labeltext,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.placeholder,
            hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold,
              color: Colors.grey[200],
            )
        ),

      ),
    );
  }
}
