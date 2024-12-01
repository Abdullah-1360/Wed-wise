import 'package:flutter/material.dart';
import '../bottomsheet/searchguestbottomsheet.dart';
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
        shape: const CircleBorder(),
        onPressed: () => _showSearchBottomSheet(context),
        backgroundColor: Colors.red[200],
        child: const Icon(Icons.search),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _index , // Adjust FAB navigation behavior
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 32,
        elevation: 20,
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
void _showSearchBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => const FractionallySizedBox(
      heightFactor: 0.8,
      child: SearchGuestBottomSheet(),
    ),
  ).then((selectedGuest) {
    if (selectedGuest != null) {
      // Handle the selected guest
      print('Selected Guest: ${selectedGuest['name']}');
    }
  });
}

