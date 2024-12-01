import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchGuestBottomSheet extends StatefulWidget {
  const SearchGuestBottomSheet({Key? key}) : super(key: key);

  @override
  _SearchGuestBottomSheetState createState() => _SearchGuestBottomSheetState();
}

class _SearchGuestBottomSheetState extends State<SearchGuestBottomSheet> {
  List<dynamic> _allGuests = [];
  List<dynamic> _filteredGuests = [];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchGuests();
  }

  Future<void> _fetchGuests() async {
    try {
      final response =
      await http.get(Uri.parse('https://tame-gem-sedum.glitch.me/guests'));

      if (response.statusCode == 200) {
        setState(() {
          _allGuests = json.decode(response.body);
          _filteredGuests = _allGuests;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load guests');
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  void _filterGuests(String query) {
    final results = _allGuests
        .where((guest) =>
        guest['name'].toString().toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _filteredGuests = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search Guests',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: _filterGuests,
          ),
          const SizedBox(height: 16),

          // Loading Indicator or Error
          if (_isLoading)
            const CircularProgressIndicator()
          else if (_hasError)
            const Text('Failed to load guests. Please try again later.')
          else
          // List of Guests
            Expanded(
              child: _filteredGuests.isNotEmpty
                  ? ListView.builder(
                shrinkWrap: true,
                itemCount: _filteredGuests.length,
                itemBuilder: (context, index) {
                  final guest = _filteredGuests[index];
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(guest['name']),
                    subtitle: Text(
                        'Priority: ${guest['priority']}\nFunction: ${guest['functionInvited']}'),
                    onTap: () {
                      Navigator.pop(context, guest);
                    },
                  );
                },
              )
                  : const Center(child: Text('No guests found')),
            ),
        ],
      ),
    );
  }
}
