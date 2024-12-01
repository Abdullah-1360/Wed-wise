import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'models/Guest.dart';

class GuestListScreen extends StatefulWidget {
  @override
  _GuestListScreenState createState() => _GuestListScreenState();
}

class _GuestListScreenState extends State<GuestListScreen> {
  late Future<List<Guest>> _guestList;

  @override
  void initState() {
    super.initState();
    _guestList = fetchGuests();
  }

  // Fetch guests from API
  Future<List<Guest>> fetchGuests() async {
    final response = await http.get(Uri.parse('https://tame-gem-sedum.glitch.me/guests'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((guest) => Guest.fromJson(guest)).toList();
    } else {
      throw Exception('Failed to load guests');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Guest>>(
      future: _guestList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Column(
            children: [
              const CircularProgressIndicator(),
              Text('Error: ${snapshot.error}'),

            ],
          ));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No guests found.'));
        }

        final guests = snapshot.data!;

        return ListView.builder(
          itemCount: guests.length,
          itemBuilder: (context, index) {
            final guest = guests[index];
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0,  bottom: 3.0),
              child: Card(
                color: getRandomLightColor(),
                child: ListTile(
                  title: Text(guest.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  subtitle: Text(
                    'Priority: ${guest.priority}\nFunction: ${guest.functionInvited}',
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(CupertinoIcons.person),
                    onPressed: () {
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

Color getRandomLightColor() {
  // Define a list of light colors
  final List<Color> lightColors = [
    Colors.pink.shade50,
    Colors.blue.shade50,
    Colors.green.shade50,
    Colors.yellow.shade50,
    Colors.orange.shade50,
    Colors.purple.shade50,
    Colors.teal.shade50,
    Colors.red.shade50,
    Colors.cyan.shade50,
    Colors.amber.shade50,
    Colors.brown.shade50,
    Colors.deepOrange.shade50,
    Colors.deepPurple.shade50,
    Colors.lightBlue.shade50,
    Colors.lightGreen.shade50,
  ];

  // Generate a random index
  final Random random = Random();
  int randomIndex = random.nextInt(lightColors.length);

  // Return a random color from the list
  return lightColors[randomIndex];
}
