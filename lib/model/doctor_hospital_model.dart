// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:blood_donation/model/user_data_model.dart';
import 'package:flutter/foundation.dart';

import 'hospital_model.dart';

class Doctors {
  List<HospitalModel>? doctors;
  Doctors({
     this.doctors,
  });

  Doctors copyWith({
    List<HospitalModel>? doctors,
  }) {
    return Doctors(
      doctors: doctors ?? this.doctors,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Doctors': doctors?.map((x) => x.toMap()).toList(),
    };
  }

  factory Doctors.fromMap(Map<String, dynamic> map) {
      if (map.containsKey("message")) {
        return Doctors();
      }
    else {
      List doctorsData = map['Doctors'] as List;
      return Doctors(
      doctors: doctorsData.map((e) => HospitalModel(id: e['id'], user: User.fromMap(e['user']))).toList()
      );
    }
    
  }

  String toJson() => json.encode(toMap());

  factory Doctors.fromJson(String source) => Doctors.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Doctors(doctors: $doctors)';

  @override
  bool operator ==(covariant Doctors other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.doctors, doctors);
  }

  @override
  int get hashCode => doctors.hashCode;
}
