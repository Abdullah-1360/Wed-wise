import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Engagement Ceremony'),
            subtitle: const Text('Date: 15th Dec, Time: 6:00 PM'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to event details
            },
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Wedding Ceremony'),
            subtitle: const Text('Date: 18th Dec, Time: 5:00 PM'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to event details
            },
          ),
        ],
      ),
    );
  }
}
