import 'package:flutter/material.dart';
import '../widgets/HomePage_Widgets/Horizontal_List.dart';
import '../widgets/HomePage_Widgets/Random_Item_List.dart';
import '../widgets/HomePage_Widgets/ScrollableImagesWithPoints.dart';
import 'Searching_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with fixed search bar
          // SliverAppBar(
          //   floating: true,
          //   pinned: true,
          //   elevation: 0,
          //   backgroundColor: Colors.transparent,
          //   title: CustomSearchBar(),
          // ),
          SliverToBoxAdapter(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0,top: 40),
                child: Text("Categories",style: TextStyle(
                  color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,right: 20.0),
                child: IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Searching_Page(),));
                },
                    icon: Icon(Icons.search,size: 25,)),
              ),
            ],
          )),
          SliverToBoxAdapter(child: Horizontal_List(),),
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.only(left: 15.0,top: 15),
            child: Text("Latest",style: TextStyle(
              color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,
            ),),
          )),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ScrollableImagesWithPoints(),
            ),
          ),
          SliverToBoxAdapter(
            child: RandomItemList(), // Random_Item_List wrapped in SliverToBoxAdapter
          ),
        ],
      ),
    );
  }
}
