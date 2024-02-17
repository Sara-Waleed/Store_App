import 'package:flutter/material.dart';

class Profile_Info extends StatelessWidget {
  const Profile_Info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.person,size: 100,),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sara Waleed"),
                Text("sara@gmail.com"),
                ElevatedButton(
                    onPressed: (){},
                    child: Text("Edit Profile ")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
