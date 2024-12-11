// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class TimeSlotModel {
  List<TimeData>? data;

  TimeSlotModel({this.data});
   TimeSlotModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TimeData>[];
      json['data'].forEach((v) {
        data!.add(TimeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeData {
  List<Doctor>? doctor;
  int? hospitalId;
  String? hospitalName;

  TimeData({this.doctor, this.hospitalId, this.hospitalName});

  TimeData.fromJson(Map<String, dynamic> json) {
    if (json['Doctor'] != null) {
      doctor = <Doctor>[];
      json['Doctor'].forEach((v) {
        doctor!.add(Doctor.fromJson(v));
      });
    }
    hospitalId = json['hospital_id'];
    hospitalName = json['hospital_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctor != null) {
      data['Doctor'] = doctor!.map((v) => v.toJson()).toList();
    }
    data['hospital_id'] = hospitalId;
    data['hospital_name'] = hospitalName;
    return data;
  }
}

class Doctor {
  int? id;
  List<TimeSlots>? timeSlots;
  String? weekday;
  int? doctor;
  int? hospital;

  Doctor({this.id, this.timeSlots, this.weekday, this.doctor, this.hospital});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['time_slots'] != null) {
      timeSlots = <TimeSlots>[];
      json['time_slots'].forEach((v) {
        timeSlots!.add(TimeSlots.fromJson(v));
      });
    }
    weekday = json['weekday'];
    doctor = json['doctor'];
    hospital = json['hospital'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (timeSlots != null) {
      data['time_slots'] = timeSlots!.map((v) => v.toJson()).toList();
    }
    data['weekday'] = weekday;
    data['doctor'] = doctor;
    data['hospital'] = hospital;
    return data;
  }
}

class TimeSlots {
  int? id;
  String? startTime;
  String? endTime;

  TimeSlots({this.id, this.startTime, this.endTime});

  TimeSlots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}

class BookedCurrentModel {
  int? bookedToken;
  int? currentToken;

  BookedCurrentModel({this.bookedToken, this.currentToken});

  BookedCurrentModel.fromJson(Map<String, dynamic> json) {
    bookedToken = json['Booked_Token'];
    currentToken = json['Current_Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Booked_Token'] = this.bookedToken;
    data['Current_Token'] = this.currentToken;
    return data;
  }
}

class BookedConfirm {
    int? id;
  
  String? createdAt;
  String? updatedAt;
  String? tokenNo;
  String? appointmentTime;
  String? status;
  int? patient;
  int? doctor;
  int? hospital;
  BookedConfirm({
    this.id,
    
    this.createdAt,
    this.updatedAt,
    this.tokenNo,
    this.appointmentTime,
    this.status,
    this.patient,
    this.doctor,
    this.hospital,
  });

  BookedConfirm copyWith({
    int? id,
    
    String? createdAt,
    String? updatedAt,
    String? tokenNo,
    String? appointmentTime,
    String? status,
    int? patient,
    int? doctor,
    int? hospital,
  }) {
    return BookedConfirm(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tokenNo: tokenNo ?? this.tokenNo,
      appointmentTime: appointmentTime ?? this.appointmentTime,
      status: status ?? this.status,
      patient: patient ?? this.patient,
      doctor: doctor ?? this.doctor,
      hospital: hospital ?? this.hospital,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'token_no': tokenNo,
      'appointment_time': appointmentTime,
      'status': status,
      'patient': patient,
      'doctor': doctor,
      'hospital': hospital,
    };
  }

  factory BookedConfirm.fromMap(Map<String, dynamic> map) {
    return BookedConfirm(
      id: map['id'] != null ? map['id'] as int : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      tokenNo: map['token_no'] != null ? map['token_no'] as String : null,
      appointmentTime: map['appointment_time'] != null ? map['appointment_time'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      patient: map['patient'] != null ? map['patient'] as int : null,
      doctor: map['doctor'] != null ? map['doctor'] as int : null,
      hospital: map['hospital'] != null ? map['hospital'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookedConfirm.fromJson(String source) => BookedConfirm.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookedConfirm(id: $id,  createdAt: $createdAt, updatedAt: $updatedAt, tokenNo: $tokenNo, appointmentTime: $appointmentTime, status: $status, patient: $patient, doctor: $doctor, hospital: $hospital)';
  }

  @override
  bool operator ==(covariant BookedConfirm other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.tokenNo == tokenNo &&
      other.appointmentTime == appointmentTime &&
      other.status == status &&
      other.patient == patient &&
      other.doctor == doctor &&
      other.hospital == hospital;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      tokenNo.hashCode ^
      appointmentTime.hashCode ^
      status.hashCode ^
      patient.hashCode ^
      doctor.hashCode ^
      hospital.hashCode;
  }
}

class DoctorTimeSlot {
  List<Data>? data;

  DoctorTimeSlot({this.data});

  DoctorTimeSlot.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<Doctor>? doctor;
  int? hospitalId;

  Data({this.doctor, this.hospitalId});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Doctor'] != null) {
      doctor = <Doctor>[];
      json['Doctor'].forEach((v) {
        doctor!.add(new Doctor.fromJson(v));
      });
    }
    hospitalId = json['hospital_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctor != null) {
      data['Doctor'] = this.doctor!.map((v) => v.toJson()).toList();
    }
    data['hospital_id'] = this.hospitalId;
    return data;
  }
}

class DoctorData {
  int? id;
  List<TimeSlots>? timeSlots;
  String? weekday;
  int? doctor;
  int? hospital;

  DoctorData({this.id, this.timeSlots, this.weekday, this.doctor, this.hospital});

  DoctorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['time_slots'] != null) {
      timeSlots = <TimeSlots>[];
      json['time_slots'].forEach((v) {
        timeSlots!.add(new TimeSlots.fromJson(v));
      });
    }
    weekday = json['weekday'];
    doctor = json['doctor'];
    hospital = json['hospital'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.timeSlots != null) {
      data['time_slots'] = this.timeSlots!.map((v) => v.toJson()).toList();
    }
    data['weekday'] = this.weekday;
    data['doctor'] = this.doctor;
    data['hospital'] = this.hospital;
    return data;
  }
}

class TimeSlotsofDoc {
  int? id;
  String? startTime;
  String? endTime;

  TimeSlotsofDoc({this.id, this.startTime, this.endTime});

  TimeSlotsofDoc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
