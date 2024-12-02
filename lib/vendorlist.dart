import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/vendor.dart';
import 'screens/vendordetailscreen.dart';

class VendorListScreen extends StatefulWidget {
  @override
  _VendorListScreenState createState() => _VendorListScreenState();
}

class _VendorListScreenState extends State<VendorListScreen> {
  late Future<List<Vendor>> _vendorList;

  @override
  void initState() {
    super.initState();
    _vendorList = fetchVendors();
  }

  // Fetch vendors from API
  Future<List<Vendor>> fetchVendors() async {
    final response = await http.get(Uri.parse('https://tame-gem-sedum.glitch.me/vendors'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((vendor) => Vendor.fromJson(vendor)).toList();
    } else {
      throw Exception('Failed to load vendors');
    }
  }

  // Refresh the list
  void refreshVendorList() {
    setState(() {
      _vendorList = fetchVendors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Vendor>>(
      future: _vendorList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No vendors found.'));
        }

        final vendors = snapshot.data!;
        return ListView.builder(
          itemCount: vendors.length,
          itemBuilder: (context, index) {
            final vendor = vendors[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VendorDetailScreen(
                        vendor: vendor,
                        onVendorDeleted: refreshVendorList, // Pass callback
                      ),
                    ),
                  );
                },
                child: Card(
                  color: getRandomLightColor(),
                  child: ListTile(
                    title: Text(vendor.vendorName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text('Contact: ${vendor.contactPerson}\nPhone: ${vendor.phoneNumber}'),
                    trailing: const Icon(CupertinoIcons.info_circle_fill,color: Colors.black38),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Generate random light color
  Color getRandomLightColor() {
    final List<Color> lightColors = [
      Colors.pink.shade50,
      Colors.blue.shade50,
      Colors.green.shade50,
      Colors.yellow.shade50,
      Colors.orange.shade50,
      Colors.purple.shade50,
      Colors.teal.shade50,
    ];
    return lightColors[Random().nextInt(lightColors.length)];
  }
}
