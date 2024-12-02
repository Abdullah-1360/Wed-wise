import 'package:flutter/material.dart';
import '../models/vendor.dart';

class VendorDetailScreen extends StatelessWidget {
  final Vendor vendor;
  final Function onVendorDeleted;

  VendorDetailScreen({required this.vendor, required this.onVendorDeleted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vendor.vendorName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact Person: ${vendor.contactPerson}', style: TextStyle(fontSize: 18)),
            Text('Email: ${vendor.email}', style: TextStyle(fontSize: 18)),
            Text('Phone Number: ${vendor.phoneNumber}', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement vendor deletion logic
                onVendorDeleted(); // Call the callback to refresh the list
                Navigator.pop(context);
              },
              child: const Text('Delete Vendor'),
            ),
          ],
        ),
      ),
    );
  }
}
