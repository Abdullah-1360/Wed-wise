import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/Guest.dart';

class GuestDetailScreen extends StatelessWidget {
  final Guest guest;
  final VoidCallback onGuestDeleted; // Callback to refresh the list

  const GuestDetailScreen({
    Key? key,
    required this.guest,
    required this.onGuestDeleted,
  }) : super(key: key);

  Future<void> deleteGuest(BuildContext context, String guestName) async {
    final response = await http.delete(
      Uri.parse('https://tame-gem-sedum.glitch.me/guests/$guestName'),
    );

    if (response.statusCode == 200) {
      final message = jsonDecode(response.body)['message'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

      onGuestDeleted(); // Trigger the callback to refresh the list
      Navigator.pop(context); // Go back to the list screen
    } else {
      final error = jsonDecode(response.body)['error'] ?? 'Failed to delete guest';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(guest.name),
              background: const Icon(
                Icons.person,
                size: 100,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${guest.name}', style: const TextStyle(fontSize: 18)),
                      Text('Priority: ${guest.priority}', style: const TextStyle(fontSize: 18)),
                      Text('Function Invited: ${guest.functionInvited}', style: const TextStyle(fontSize: 18)),

                      const SizedBox(height: 20),
                      const SizedBox(height: 16),

                      // Dummy Chips with Wrap
                      Text(
                        'Tags',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: List.generate(
                          10, // Number of chips
                              (index) => Chip(
                            label: Text('Tag ${index + 1}'),
                            backgroundColor: Colors.pink.shade50,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.redAccent[100],
        onPressed: () => deleteGuest(context, guest.name),child: const Icon(CupertinoIcons.delete,color: Colors.black,),
    ),
    );
  }
}
