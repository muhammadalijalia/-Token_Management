class AppointModel {
  List<Appointment>? appointment;

  AppointModel({this.appointment});

  AppointModel.fromJson(Map<String, dynamic> json) {
    if (json['Appointment'] != null) {
      appointment = <Appointment>[];
      json['Appointment'].forEach((v) {
        appointment!.add(new Appointment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointment != null) {
      data['Appointment'] = this.appointment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appointment {
  int? id;
  String? doctor;
  String? hospital;
  String? patientName;
  String? patientPh;
  String? patientEmail;
  String? tokenNo;
  String? status;
  String? date;
  String? time;

  Appointment(
      {this.id,
      this.doctor,
      this.hospital,
      this.patientName,
      this.patientPh,
      this.patientEmail,
      this.tokenNo,
      this.status,
      this.date,
      this.time});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctor = json['doctor'];
    hospital = json['hospital'];
    patientName = json['patient_name'];
    patientPh = json['patient ph'];
    patientEmail = json['patient email'];
    tokenNo = json['token_no'];
    status = json['status'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor'] = this.doctor;
    data['hospital'] = this.hospital;
    data['patient_name'] = this.patientName;
    data['patient ph'] = this.patientPh;
    data['patient email'] = this.patientEmail;
    data['token_no'] = this.tokenNo;
    data['status'] = this.status;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}