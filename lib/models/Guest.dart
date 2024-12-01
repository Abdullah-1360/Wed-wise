class Guest {
  final String name;
  final String priority;
  final String functionInvited;

  Guest({required this.name, required this.priority, required this.functionInvited});

  // Factory method to create Guest from JSON
  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      name: json['name'],
      priority: json['priority'],
      functionInvited: json['functionInvited'],
    );
  }
}
