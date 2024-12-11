// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class PublishEvent {
        final int? id;
       
        final String? created_at;
        final String? updated_at;
        final String? image_url;
        final String? event_name;
        final String? date_of_event;
        final String? start_date;
        final String? start_time;
        final String? end_date;
        final String? end_time;
        final String? city;
        final String? address;
        final String? content;
        final int? status;
  PublishEvent({
    this.id,
   
    this.created_at,
    this.updated_at,
    this.image_url,
    this.event_name,
    this.date_of_event,
    this.start_date,
    this.start_time,
    this.end_date,
    this.end_time,
    this.city,
    this.address,
    this.content,
    this.status,
  });

  PublishEvent copyWith({
    int? id,
   
    String? created_at,
    String? updated_at,
    String? image_url,
    String? event_name,
    String? date_of_event,
    String? start_date,
    String? start_time,
    String? end_date,
    String? end_time,
    String? city,
    String? address,
    String? content,
    int? status,
  }) {
    return PublishEvent(
      id: id ?? this.id,
     
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      image_url: image_url ?? this.image_url,
      event_name: event_name ?? this.event_name,
      date_of_event: date_of_event ?? this.date_of_event,
      start_date: start_date ?? this.start_date,
      start_time: start_time ?? this.start_time,
      end_date: end_date ?? this.end_date,
      end_time: end_time ?? this.end_time,
      city: city ?? this.city,
      address: address ?? this.address,
      content: content ?? this.content,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      
      'created_at': created_at,
      'updated_at': updated_at,
      'image_url': image_url,
      'event_name': event_name,
      'date_of_event': date_of_event,
      'start_date': start_date,
      'start_time': start_time,
      'end_date': end_date,
      'end_time': end_time,
      'city': city,
      'address': address,
      'content': content,
      'status': status,
    };
  }

  factory PublishEvent.fromMap(Map<String, dynamic> map) {
    return PublishEvent(
      id: map['id'] != null ? map['id'] as int : null,
      
      created_at: map['created_at'] != null ? map['created_at'] as String : null,
      updated_at: map['updated_at'] != null ? map['updated_at'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      event_name: map['event_name'] != null ? map['event_name'] as String : null,
      date_of_event: map['date_of_event'] != null ? map['date_of_event'] as String : null,
      start_date: map['start_date'] != null ? map['start_date'] as String : null,
      start_time: map['start_time'] != null ? map['start_time'] as String : null,
      end_date: map['end_date'] != null ? map['end_date'] as String : null,
      end_time: map['end_time'] != null ? map['end_time'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublishEvent.fromJson(String source) => PublishEvent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublishEvent(id: $id, created_at: $created_at, updated_at: $updated_at, image_url: $image_url, event_name: $event_name, date_of_event: $date_of_event, start_date: $start_date, start_time: $start_time, end_date: $end_date, end_time: $end_time, city: $city, address: $address, content: $content, status: $status)';
  }

  @override
  bool operator ==(covariant PublishEvent other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.image_url == image_url &&
      other.event_name == event_name &&
      other.date_of_event == date_of_event &&
      other.start_date == start_date &&
      other.start_time == start_time &&
      other.end_date == end_date &&
      other.end_time == end_time &&
      other.city == city &&
      other.address == address &&
      other.content == content &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      
      created_at.hashCode ^
      updated_at.hashCode ^
      image_url.hashCode ^
      event_name.hashCode ^
      date_of_event.hashCode ^
      start_date.hashCode ^
      start_time.hashCode ^
      end_date.hashCode ^
      end_time.hashCode ^
      city.hashCode ^
      address.hashCode ^
      content.hashCode ^
      status.hashCode;
  }
}
