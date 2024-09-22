class PayingGuest {
  final String id;
  final String name;
  final String description;
  final String address;
  final String city;
  final String state;
  final String country;
  final String email;
  final String phone;
  final String image;
  final double latitude;
  final double longitude;
  final double rating;
  final int totalRatings;
  final bool isVerified;

  PayingGuest({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.email,
    required this.phone,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.isVerified,
    required this.rating,
    required this.totalRatings,
  });
}