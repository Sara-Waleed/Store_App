import 'package:flutter/material.dart';
import '../widgets/Profile_widgets/Profile_Info.dart';
import '../widgets/Profile_widgets/Profile_Options.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          //the first two icons:
          Container(
           // color: Colors.red,
            height: 100,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.message),
                SizedBox(width: 20,),
                Icon(Icons.notifications_active),
              ],
            ),
          ),
          ),
          //personal info part
          Profile_Info(),
// the first part
          Profile_Options(),

          SizedBox(height: 10,),
          //the same second part
          Profile_Options(),
        ],
      ),
    );
  }
}



