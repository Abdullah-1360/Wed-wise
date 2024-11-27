import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'search.dart';
import 'profile.dart';
import 'home.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
   int _index = 1;
   List pages = [
     const Search(),

     const Home(),
     const Profile(),
   ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black.withOpacity(0.5),
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          currentIndex: _index,
          enableFeedback: true,
          
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
      elevation: 0,
      onTap: (index) => {
        if (index != _index)
            setState(() {
              _index = index ;
            })
      },

      items:

          const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.apps),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          ]
      ),
    );
  }
}
