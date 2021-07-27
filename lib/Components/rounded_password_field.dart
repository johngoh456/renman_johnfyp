import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {

  // final TextEditingController passwordController = new TextEditingController();
  final ValueChanged<String> onChanged;
  final String hinttext;

  RoundedPasswordField({
    Key key,

    this.hinttext,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isHiddenPassword =true;

  void _togglepasswordview(){
   if(isHiddenPassword ==true){
     isHiddenPassword=false;
   }else{
     isHiddenPassword=true;
   }
   setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        // controller: passwordController,
        obscureText: isHiddenPassword,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            hintText: widget.hinttext,
            icon: Icon(
                Icons.lock
            ),
            suffixIcon: InkWell(
              onTap: _togglepasswordview,
              child: isHiddenPassword?Icon(Icons.visibility):Icon(Icons.visibility_off)
            ),
            border: InputBorder.none
        ),
      ),

    );
  }
}