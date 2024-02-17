import 'package:flutter/material.dart';


class Profile_Options extends StatelessWidget {
  const Profile_Options({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.grey
          ),
        ),
        child: Column(
          children: [
            Column(
              children: List.generate(
                4,
                    (index) =>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.list),
                          SizedBox(width: 10,),
                          Text("All My Orders"),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                          child: Icon(Icons.navigate_next,)),
                    ],
                  ),
                ),

              ),

            ),
          ],
        ),
      ),
    );
  }
}