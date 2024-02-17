import 'package:flutter/material.dart';

import '../widgets/HomePage_Widgets/SearchBar.dart';

class Searching_Page extends StatelessWidget {
  const Searching_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            SizedBox(height: 50,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Search",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
            ),
            CustomSearchBar(),
            SizedBox(height: 10,),
            // texts
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recently viewed",style: TextStyle(color: Colors.grey),),
                  Text("Clear",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                ],
              ),

            ),
            SizedBox(height: 10,),
    //recently viewed
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
      children: List.generate(
      5,
      (index) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),

          height: 60,
          width: 200,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:Image.asset("assets/item.jpg"),),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Item Name"),
                      Text("Price"),
                    ],
                  ),
                
              
            ],
          ),
        ),
      ),
      ),

      ),
    ),
            // recommended part:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recommended",style: TextStyle(color: Colors.grey),),
                Text("Refrech",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
              ],
            ),


          ),
          Container(
            height: 200,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey ,
                  ),
                );
              },
            ),
          ),
        ],

      ),




          ],
        ),
      ),

    );
  }
}
