import 'package:flutter/material.dart';
import 'Fav_Item_Page.dart';
import 'HomePage.dart';
import 'Log_In.dart';
import 'Profile_Page.dart';
import 'Purchasing_Items.dart';
import 'Registeration.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "login":(context) => LogInScreen(),
        "Register":(context) => RegisterScreen(),
        "home":(context) => HomePage(),
      },
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    FavItems(),
    Purchasing_Items(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.grey,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,color: Colors.grey,),
            label: 'Favorate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,color: Colors.grey,),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.grey,),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

