// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Provinces {
  int? id;
  String? name;
  String? image_url;
  bool? enabled;
  String? createdAt;
  String? updatedAt;

  Provinces({
    this.id,
    this.name,
    this.image_url,
    this.enabled,
    this.createdAt,
    this.updatedAt,
  });

  Provinces copyWith({
    int? id,
    String? name,
    String? image_url,
    bool? enabled,
    String? createdAt,
    String? updatedAt,
  }) {
    return Provinces(
      id: id ?? this.id,
      name: name ?? this.name,
      image_url: image_url ?? this.image_url,
      enabled: enabled ?? this.enabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image_url': image_url,
      'enabled': enabled,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Provinces.fromMap(Map<String, dynamic> map) {
    return Provinces(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      enabled: map['enabled'] != null ? map['enabled'] as bool : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Provinces.fromJson(String source) =>
      Provinces.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Provinces(id: $id, name: $name, image_url: $image_url, enabled: $enabled, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Provinces other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image_url == image_url &&
        other.enabled == enabled &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image_url.hashCode ^
        enabled.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
