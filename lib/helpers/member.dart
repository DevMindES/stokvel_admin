class Member {
  String id;
  String name;
  String status;
  String debt;

  Member({
    required this.id,
    required this.name,
    required this.status,
    this.debt = '',
  });

  // Factory constructor to create a Member from a Map, suitable for Firestore data
  factory Member.fromMap(Map<String, dynamic> data) {
    return Member(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      status: data['status'] ?? '',
      debt: data['debt'] ?? '',
    );
  }

  // Convert a Member instance to Map, useful for sending data to Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'debt': debt,
    };
  }
}
