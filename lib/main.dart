import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedwise/screens/welcomscreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.pink, // Set status bar color
        statusBarIconBrightness: Brightness.light, // Set status bar icon color (light or dark)
      ),
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
