class Vendor {
  final String vendorName;
  final String contactPerson;
  final String email;
  final String phoneNumber;

  Vendor({
    required this.vendorName,
    required this.contactPerson,
    required this.email,
    required this.phoneNumber,
  });

  // Create a Vendor object from JSON data
  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      vendorName: json['vendor_name'],
      contactPerson: json['contact_person'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }
}
