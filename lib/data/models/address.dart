import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Address {
  int? id;
  String? name;
  String? phone;
  String? description;
  String? address;
  String? latitude;
  String? longitude;
  int? user_id;
  String? created_at;
  String? updated_at;

  Address({
    this.id,
    this.name,
    this.phone,
    this.description,
    this.address,
    this.latitude,
    this.longitude,
    this.user_id,
    this.created_at,
    this.updated_at,
  });

  Address copyWith({
    int? id,
    String? name,
    String? phone,
    String? description,
    String? address,
    String? latitude,
    String? longitude,
    int? user_id,
    String? created_at,
    String? updated_at,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      description: description ?? this.description,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      user_id: user_id ?? this.user_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'description': description,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'user_id': user_id,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
      user_id: map['user_id'] != null ? map['user_id'] as int : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(id: $id, name: $name, phone: $phone, description: $description, address: $address, latitude: $latitude, longitude: $longitude, user_id: $user_id, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.description == description &&
        other.address == address &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.user_id == user_id &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        description.hashCode ^
        address.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        user_id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
