// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
        final String first_name;
        final String last_name;
        final String email;
        final String image_url;
        final String phone_number;
        final String city;
        final String address;
        final String address_2;
        final String country;
        final String postal_code;
  User({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.image_url,
    required this.phone_number,
    required this.city,
    required this.address,
    required this.address_2,
    required this.country,
    required this.postal_code,
  });
    // Empty constructor
  User.empty()
      : first_name = '',
        last_name = '',
        email = '',
        image_url = '',
        phone_number = '',
        city = '',
        address = '',
        address_2 = '',
        country = '',
        postal_code = '';


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'image_url': image_url,
      'phone_number': phone_number,
      'city': city,
      'address': address,
      'address_2': address_2,
      'country': country,
      'postal_code': postal_code,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      email: map['email'] as String,
     image_url: map['image_url'] as String? ?? '',
      phone_number: map['phone_number'] as String,
      city: map['city'] as String? ?? '',
      address: map['address'] as String? ?? '',
      address_2: map['address_2'] as String? ?? '',
      country: map['country'] as String? ?? '',
      postal_code: map['postal_code'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(first_name: $first_name, last_name: $last_name, email: $email, image_url: $image_url, phone_number: $phone_number, city: $city, address: $address, address_2: $address_2, country: $country, postal_code: $postal_code)';
  }
}

class UserDataModel {
  final int id;
  final User user;
  final String blood_group;
  UserDataModel({
    required this.id,
    required this.user,
    required this.blood_group,
  });
   UserDataModel.empty()
      : id = 0,
        user = User.empty(),  // Assuming User has an empty constructor as well
        blood_group = '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user.toMap(),
      'blood_group': blood_group,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'] as int,
      user: User.fromMap(map['user'] as Map<String,dynamic>),
      blood_group: map['blood_group'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) => UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserDataModel(id: $id, user: $user, blood_group: $blood_group)';
}
