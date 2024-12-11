// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class UserData {
final int? id;
final String? first_name;
final String? last_name;
final String? email;
final String? phone_number;
final String? dob;
final int? dhp_id;
final String? university_name;
final String? seat_no;
final String? access_token;
final int? expires_in;
final String? token_type;
final String? scope;
final String? refresh_token;
  UserData({
    this.id,
    this.first_name,
    this.last_name,
    this.email,
    this.phone_number,
    this.dob,
    this.dhp_id,
    this.university_name,
    this.seat_no,
    this.access_token,
    this.expires_in,
    this.token_type,
    this.scope,
    this.refresh_token,
  });




  UserData copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? email,
    String? phone_number,
    String? dob,
    int? dhp_id,
    String? university_name,
    String? seat_no,
    String? access_token,
    int? expires_in,
    String? token_type,
    String? scope,
    String? refresh_token,
  }) {
    return UserData(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      phone_number: phone_number ?? this.phone_number,
      dob: dob ?? this.dob,
      dhp_id: dhp_id ?? this.dhp_id,
      university_name: university_name ?? this.university_name,
      seat_no: seat_no ?? this.seat_no,
      access_token: access_token ?? this.access_token,
      expires_in: expires_in ?? this.expires_in,
      token_type: token_type ?? this.token_type,
      scope: scope ?? this.scope,
      refresh_token: refresh_token ?? this.refresh_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'phone_number': phone_number,
      'dob': dob,
      'dhp_id': dhp_id,
      'university_name': university_name,
      'seat_no': seat_no,
      'access_token': access_token,
      'expires_in': expires_in,
      'token_type': token_type,
      'scope': scope,
      'refresh_token': refresh_token,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] != null ? map['id'] as int : null,
      first_name: map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone_number: map['phone_number'] != null ? map['phone_number'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      dhp_id: map['dhp_id'] != null ? map['dhp_id'] as int : null,
      university_name: map['university_name'] != null ? map['university_name'] as String : null,
      seat_no: map['seat_no'] != null ? map['seat_no'] as String : null,
      access_token: map['access_token'] != null ? map['access_token'] as String : null,
      expires_in: map['expires_in'] != null ? map['expires_in'] as int : null,
      token_type: map['token_type'] != null ? map['token_type'] as String : null,
      scope: map['scope'] != null ? map['scope'] as String : null,
      refresh_token: map['refresh_token'] != null ? map['refresh_token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) => UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(id: $id, first_name: $first_name, last_name: $last_name, email: $email, phone_number: $phone_number, dob: $dob, dhp_id: $dhp_id, university_name: $university_name, seat_no: $seat_no, access_token: $access_token, expires_in: $expires_in, token_type: $token_type, scope: $scope, refresh_token: $refresh_token)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.email == email &&
      other.phone_number == phone_number &&
      other.dob == dob &&
      other.dhp_id == dhp_id &&
      other.university_name == university_name &&
      other.seat_no == seat_no &&
      other.access_token == access_token &&
      other.expires_in == expires_in &&
      other.token_type == token_type &&
      other.scope == scope &&
      other.refresh_token == refresh_token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      email.hashCode ^
      phone_number.hashCode ^
      dob.hashCode ^
      dhp_id.hashCode ^
      university_name.hashCode ^
      seat_no.hashCode ^
      access_token.hashCode ^
      expires_in.hashCode ^
      token_type.hashCode ^
      scope.hashCode ^
      refresh_token.hashCode;
  }
}
