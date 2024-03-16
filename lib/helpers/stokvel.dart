import 'package:stokvel_admin/helpers/member.dart';

class Stokvel {
  String name;
  List<Member> members;

  Stokvel({required this.name, required this.members});

  // Utility method to convert a Stokvel instance into a map, useful for database operations
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'members': members.map((member) => member.toMap()).toList(),
    };
  }

  // Factory method to create a Stokvel instance from a map, useful for data retrieval
  factory Stokvel.fromMap(Map<String, dynamic> map) {
    return Stokvel(
      name: map['name'],
      members: List<Member>.from(map['members']?.map((x) => Member.fromMap(x)) ?? []),
    );
  }
}
