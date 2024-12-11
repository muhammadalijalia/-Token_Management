// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'user_data_model.dart';

class HospitalModel {
        final int id;
        final User user;
        final String? hospital_Detail;
        final String? hospital_Timing;
  HospitalModel({
    required this.id,
    required this.user,
    this.hospital_Detail,
    this.hospital_Timing,
  });
  

  HospitalModel copyWith({
    int? id,
    User? user,
    String? hospital_Detail,
    String? hospital_Timing,
  }) {
    return HospitalModel(
      id: id ?? this.id,
      user: user ?? this.user,
      hospital_Detail: hospital_Detail ?? this.hospital_Detail,
      hospital_Timing: hospital_Timing ?? this.hospital_Timing,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user.toMap(),
      'hospital_Detail': hospital_Detail,
      'hospital_Timing': hospital_Timing,
    };
  }

  factory HospitalModel.fromMap(Map<String, dynamic> map) {
    return HospitalModel(
      id: map['id'] as int,
      user: User.fromMap(map['user'] as Map<String,dynamic>),
      hospital_Detail: map['hospital_Detail'] != null ? map['hospital_Detail'] as String : null,
      hospital_Timing: map['hospital_Timing'] != null ? map['hospital_Timing'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HospitalModel.fromJson(String source) => HospitalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HospitalModel(id: $id, user: $user, hospital_Detail: $hospital_Detail, hospital_Timing: $hospital_Timing)';
  }

  @override
  bool operator ==(covariant HospitalModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user == user &&
      other.hospital_Detail == hospital_Detail &&
      other.hospital_Timing == hospital_Timing;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user.hashCode ^
      hospital_Detail.hashCode ^
      hospital_Timing.hashCode;
  }
    }
