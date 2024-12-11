// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ForgetModel {

  
  final String? Password;
  final String? message;
  ForgetModel({
    this.Password,
    this.message,
  });

  ForgetModel copyWith({
    String? Password,
    String? message,
  }) {
    return ForgetModel(
      Password: Password ?? this.Password,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Password': Password,
      'message': message,
    };
  }

  factory ForgetModel.fromMap(Map<String, dynamic> map) {
    return ForgetModel(
      Password: map['Password'] != null ? map['Password'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForgetModel.fromJson(String source) => ForgetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ForgetModel(Password: $Password, message: $message)';

  @override
  bool operator ==(covariant ForgetModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.Password == Password &&
      other.message == message;
  }

  @override
  int get hashCode => Password.hashCode ^ message.hashCode;
}
