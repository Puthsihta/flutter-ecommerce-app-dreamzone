import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RequestCreatAddress {
  String name;
  String phone;
  String? description;
  String address;
  String latitude;
  String longitude;

  RequestCreatAddress({
    required this.name,
    required this.phone,
    this.description,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  RequestCreatAddress copyWith({
    String? name,
    String? phone,
    String? description,
    String? address,
    String? latitude,
    String? longitude,
  }) {
    return RequestCreatAddress(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      description: description ?? this.description,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'description': description,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory RequestCreatAddress.fromMap(Map<String, dynamic> map) {
    return RequestCreatAddress(
      name: map['name'] as String,
      phone: map['phone'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      address: map['address'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestCreatAddress.fromJson(String source) =>
      RequestCreatAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RequestCreatAddress(name: $name, phone: $phone, description: $description, address: $address, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant RequestCreatAddress other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.phone == phone &&
        other.description == description &&
        other.address == address &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone.hashCode ^
        description.hashCode ^
        address.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
