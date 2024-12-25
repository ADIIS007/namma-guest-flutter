class PayingGuest {
  String name;
  String description;
  String address;
  String city;
  String state;
  String country;
  String email;
  String contactNumber;
  String whatsappNumber;
  String image;
  double latitude;
  double longitude;
  double rating;
  int totalRatings;
  int pinCode;
  bool isVerified;

  PayingGuest({
    this.name = '',
    this.description = '',
    this.address = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.email = '',
    this.contactNumber = '',
    this.whatsappNumber = '',
    this.image = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.rating = 0.0,
    this.totalRatings = 0,
    this.isVerified = false,
    this.pinCode = 0,
  });

  // Setters for each field
  set setName(String value) => name = value;
  set setDescription(String value) => description = value;
  set setAddress(String value) => address = value;
  set setCity(String value) => city = value;
  set setState(String value) => state = value;
  set setCountry(String value) => country = value;
  set setEmail(String value) => email = value;
  set setPhone(String value) => contactNumber = value;
  set setWhatsappNumber(String value) => whatsappNumber = value;
  set setImage(String value) => image = value;
  set setLatitude(double value) => latitude = value;
  set setLongitude(double value) => longitude = value;
  set setRating(double value) => rating = value;
  set setTotalRatings(int value) => totalRatings = value;
  set setIsVerified(bool value) => isVerified = value;
  set setPinCode(int value) => pinCode = value;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'email': email,
      'contactNumber': contactNumber,
      'whatsappNumber': whatsappNumber,
      'image': image,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
      'totalRatings': totalRatings,
      'isVerified': isVerified,
      'pinCode': pinCode,
    };
  }

  // toString method to provide a string representation of the object
  @override
  String toString() {
    return 'PayingGuest(name: $name, description: $description, address: $address, city: $city, state: $state, country: $country, email: $email, contactNumber: $contactNumber, whatsappNumber: $whatsappNumber, image: $image, latitude: $latitude, longitude: $longitude, rating: $rating, totalRatings: $totalRatings, isVerified: $isVerified, pinCode: $pinCode)';
  }
}