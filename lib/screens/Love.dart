import 'package:flutter/material.dart';

class LoveScreen extends StatelessWidget {
  const LoveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> quotes = [
      '“A successful marriage requires falling in love many times, always with the same person.”',
      '“Love recognizes no barriers. It jumps hurdles, leaps fences, penetrates walls to arrive at its destination full of hope.”',
      '“The best thing to hold onto in life is each other.”',
      '“You don’t marry someone you can live with — you marry someone you cannot live without.”',
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loveimage.png'), // Ensure this image exists in your assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content with a transparent overlay
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.favorite, size: 100, color: Colors.pinkAccent),
                const SizedBox(height: 20),
                Text(
                  'Celebrate Love ❤️',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // List of romantic quotes
                Expanded(
                  child: ListView.builder(
                    itemCount: quotes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            quotes[index],
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.black87,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Action buttons
                ElevatedButton(
                  onPressed: () {
                    // Add action (e.g., navigate to another screen or share)
                    // Example: Navigator.push(context, MaterialPageRoute(builder: (_) => AnotherScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Share the Love 💌',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    // Show more quotes or navigate
                    // Example: showDialog to show more quotes
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text(
                    'More Inspiration 🌸',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
