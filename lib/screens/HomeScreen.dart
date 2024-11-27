import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'search.dart';
import 'profile.dart';
import 'home.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _index = 0; // Default index
  List<IconData> iconList = [
    Icons.home,
    Icons.person,];
  List<Widget> pages = [
    const Home(),
    // Search page for FAB navigation

    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          // Navigate to the Search page when FAB is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Search()),
          );
        },
        child: const Icon(Icons.search),
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _index , // Adjust FAB navigation behavior
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          setState(() {
            _index = index; // Navigate to Home or Profile
          });
        },
      ),
    );
  }
}
