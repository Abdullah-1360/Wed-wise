import 'package:flutter/material.dart';

class GiftsScreen extends StatelessWidget {
  const GiftsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gifts'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.card_giftcard, color: Colors.pink),
              title: Text('Customized Photo Album'),
              subtitle: Text('Perfect memory keepsake'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.card_giftcard, color: Colors.pink),
              title: Text('Dinner Set'),
              subtitle: Text('Elegant and practical'),
            ),
          ),
        ],
      ),
    );
  }
}
