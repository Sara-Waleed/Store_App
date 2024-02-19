import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Horizontal_List extends StatelessWidget {
  const Horizontal_List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0,left: 10),
      child: Container(
        height: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0,left:5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue,
                      ),
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Icon(Icons.shopping_bag_rounded),
                      ),
                    ),
                    SizedBox(height: 5,),

                    Text("All"),
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  10,
                      (index) => Padding(
                    padding: const EdgeInsets.only(right: 5.0,left:5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blue,
                          ),
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              "assets/item.jpg",fit: BoxFit.fill,
                              // Ensure the image fills the circular shape
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),

                        Text("item"),
                      ],
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}