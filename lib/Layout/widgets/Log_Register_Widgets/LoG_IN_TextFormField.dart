import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TextFieldLogIn extends StatelessWidget {
  TextFieldLogIn({
    this.hintText,
    this.onchange,
    this.obscureText=false,
    super.key,
  });
  bool obscureText;
  final String? hintText;
  final Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if(value!.isEmpty){
          return "value is wrong";
        }
        return "";
      },
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),

    );
  }
}
