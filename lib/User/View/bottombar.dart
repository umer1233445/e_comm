import 'package:flutter/material.dart';
import 'package:umer/User/View/explore_screen.dart';
import 'package:umer/User/View/fetch_screen.dart';
import 'package:umer/User/View/product_screen.dart';

class Bottom_bar extends StatefulWidget {
  const Bottom_bar({super.key});

  @override
  State<Bottom_bar> createState() => _Bottom_barState();
}

class _Bottom_barState extends State<Bottom_bar> {

  int currentIndex = 0;

  void pageShifter(index){
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> myScreens = [
    Fetch_Screen(),
    Explore_Screen(),
    Fetch_Screen(),
    Product_Screen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  myScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.cyanAccent,
          showUnselectedLabels: true,
          onTap: pageShifter,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: "Explore",),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Cart",),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist",)
          ]),


    );
  }
}
