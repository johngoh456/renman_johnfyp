import 'package:flutter/material.dart';
import 'package:renman_johnfyp/Components/text_field_container.dart';
class RoundedInputField extends StatelessWidget {
  // final  emailController = new TextEditingController();
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
    const RoundedInputField({

    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
      // this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFieldContainer(

      child:TextField(
        // controller: emailController,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}