// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpModel {
  
    final int? id;
    final String? first_name;
    final String? last_name;
    final String? email;
    final String? phone_number;
    final String? gender;
    final String? dob;
    final int? university_name;
    final String? seat_no;
    final String? role;
    final String? city;
    final String? address;
    final String? blood_group;
    final int? no_of_donations;
    final String? image_url;
  SignUpModel({
    this.id,
    this.first_name,
    this.last_name,
    this.email,
    this.phone_number,
    this.gender,
    this.dob,
    this.university_name,
    this.seat_no,
    this.role,
    this.city,
    this.address,
    this.blood_group,
    this.no_of_donations,
    this.image_url,
  });


  SignUpModel copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? email,
    String? phone_number,
    String? gender,
    String? dob,
    int? university_name,
    String? seat_no,
    String? role,
    String? city,
    String? address,
    String? blood_group,
    int? no_of_donations,
    String? image_url,
  }) {
    return SignUpModel(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      phone_number: phone_number ?? this.phone_number,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      university_name: university_name ?? this.university_name,
      seat_no: seat_no ?? this.seat_no,
      role: role ?? this.role,
      city: city ?? this.city,
      address: address ?? this.address,
      blood_group: blood_group ?? this.blood_group,
      no_of_donations: no_of_donations ?? this.no_of_donations,
      image_url: image_url ?? this.image_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'phone_number': phone_number,
      'gender': gender,
      'dob': dob,
      'university_name': university_name,
      'seat_no': seat_no,
      'role': role,
      'city': city,
      'address': address,
      'blood_group': blood_group,
      'no_of_donations': no_of_donations,
      'image_url': image_url,
    };
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      id: map['id'] != null ? map['id'] as int : null,
      first_name: map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone_number: map['phone_number'] != null ? map['phone_number'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      university_name: map['university_name'] != null ? map['university_name'] as int : null,
      seat_no: map['seat_no'] != null ? map['seat_no'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      blood_group: map['blood_group'] != null ? map['blood_group'] as String : null,
      no_of_donations: map['no_of_donations'] != null ? map['no_of_donations'] as int : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) => SignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpModel(id: $id, first_name: $first_name, last_name: $last_name, email: $email, phone_number: $phone_number, gender: $gender, dob: $dob, university_name: $university_name, seat_no: $seat_no, role: $role, city: $city, address: $address, blood_group: $blood_group, no_of_donations: $no_of_donations, image_url: $image_url)';
  }

  @override
  bool operator ==(covariant SignUpModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.email == email &&
      other.phone_number == phone_number &&
      other.gender == gender &&
      other.dob == dob &&
      other.university_name == university_name &&
      other.seat_no == seat_no &&
      other.role == role &&
      other.city == city &&
      other.address == address &&
      other.blood_group == blood_group &&
      other.no_of_donations == no_of_donations &&
      other.image_url == image_url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      email.hashCode ^
      phone_number.hashCode ^
      gender.hashCode ^
      dob.hashCode ^
      university_name.hashCode ^
      seat_no.hashCode ^
      role.hashCode ^
      city.hashCode ^
      address.hashCode ^
      blood_group.hashCode ^
      no_of_donations.hashCode ^
      image_url.hashCode;
  }
}