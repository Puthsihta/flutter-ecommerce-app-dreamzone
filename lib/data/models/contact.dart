import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Contact {
  String? title;
  String? phone;
  String? email;
  String? web;
  String? address;
  String? latitude;
  String? longitude;
  Contact({
    this.title,
    this.phone,
    this.email,
    this.web,
    this.address,
    this.latitude,
    this.longitude,
  });

  Contact copyWith({
    String? title,
    String? phone,
    String? email,
    String? web,
    String? address,
    String? latitude,
    String? longitude,
  }) {
    return Contact(
      title: title ?? this.title,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      web: web ?? this.web,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'phone': phone,
      'email': email,
      'web': web,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      title: map['title'] != null ? map['title'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      web: map['web'] != null ? map['web'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Contact(title: $title, phone: $phone, email: $email, web: $web, address: $address, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant Contact other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.phone == phone &&
        other.email == email &&
        other.web == web &&
        other.address == address &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        web.hashCode ^
        address.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
