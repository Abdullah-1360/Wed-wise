import 'package:flutter/material.dart';
import 'package:wedwise/screens/HomeScreen.dart';
import 'package:wedwise/screens/welcomscreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen()
        //WelcomeScreen(),
    );
  }
}
