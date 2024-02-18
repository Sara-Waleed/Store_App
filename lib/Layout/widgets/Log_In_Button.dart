import 'package:flutter/material.dart';


class buttonItem extends StatelessWidget {
  buttonItem({
    this.text,
    this.ontap,
    super.key,
  });
  final String? text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        width:100,
        height: 50,
        child: Center(child: Text("$text",style: TextStyle(color: Colors.white,fontSize: 20),)),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),

      ),
    );
  }
}