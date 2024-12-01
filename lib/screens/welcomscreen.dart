import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wedwise/screens/HomeScreen.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> anims = [
    'assets/anim/page1.json',
    'assets/anim/page2.json',
    'assets/anim/coupleanim.json',
  ];

  final List<String> titles = [
    "Plan Your Dream Wedding!",
    "Stay Organized Effortlessly",
    'Plan Together, Anytime, Anywhere!',
  ];

  final List<String> descriptions = [
    "Welcome to Wed-Wise, your all-in-one wedding planner. Let's make your big day unforgettable!",
    "Track your tasks, manage your budget, and collaborate with ease. Enjoy a stress-free planning journey!",
    'Collaborate with your partner, family, and friends in real-time. Your happily ever after begins here!',
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: anims.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (_, index) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset(
                    anims[index],
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    titles[index],
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      descriptions[index],
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      anims.length,
                          (dotIndex) => Container(
                        height: 12,
                        width: dotIndex == currentPage ? 16 : 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentPage == dotIndex
                              ? Colors.redAccent
                              : Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (currentPage == anims.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to home or main screen
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homescreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,color: Colors.white,size: 30,
                      ),
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
