class Restroom {
  final String name;
  final String street;
  final String city;
  final String state;
  final String country;
  final double latitude;
  final double longitude;
  final String directions;
  final String comment;
  final bool accessible;
  final bool changingTable;
  final bool unisex;

  Restroom({
    required this.name,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.directions,
    required this.comment,
    required this.accessible,
    required this.changingTable,
    required this.unisex,
  });

  factory Restroom.fromJson(Map<String, dynamic> json) {
    return Restroom(
      name: json['name'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      directions: json['directions'] ?? '',
      comment: json['comment'] ?? '',
      accessible: json['accessible'] ?? false,
      changingTable: json['changing_table'] ?? false,
      unisex: json['unisex'] ?? false,
    );
  }
}
