import 'package:flutter/material.dart';

class Purchasing_Items extends StatelessWidget {
  const Purchasing_Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //the first two icons
          Container(
            // color: Colors.red,
            height: 80,
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
          // the first text:
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Cart",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),),
          ),
          //list of orders:
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                  14,
                      (index) =>Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    "assets/item.jpg",fit: BoxFit.fill,
                                    width: 100,
                                    height: 100,
                                    // Ensure the image fills the circular shape
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Apple Headphone",style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text("Shiny Black",style: TextStyle(
                                      color: Colors.grey
                                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey
                        ),
                        child: Center(child: IconButton(icon: Icon(Icons.add), onPressed: () {  },))),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                        ),
                        child: Center(child: Text("1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),))),
                    Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey
                        ),
                        child: Center(child: IconButton(icon: Icon(Icons.minimize), onPressed: () {  },))),
                  ],
                )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                ),

              ),
            ),
          ),
          Expanded(
            flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  border: Border.all(color: Colors.white)
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total"),
                          Text("\$81.57"),
                          Text("Free Domastic Shipping"),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Text(
                                "checkout"
                              ),
                              Container(
                                child:Icon(Icons.navigate_next),
                              ),
                            ],
                          ),),
                    )
                  ],
                ),
          )),

        ],
      ),

    );
  }
}
