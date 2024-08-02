import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentMethod {
  int? id;
  String? name;
  String? description;
  String? type;
  String? image_url;
  int? user_id;
  String? created_at;
  String? updated_at;

  PaymentMethod({
    this.id,
    this.name,
    this.description,
    this.type,
    this.image_url,
    this.user_id,
    this.created_at,
    this.updated_at,
  });

  PaymentMethod copyWith({
    int? id,
    String? name,
    String? description,
    String? type,
    String? image_url,
    int? user_id,
    String? created_at,
    String? updated_at,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      image_url: image_url ?? this.image_url,
      user_id: user_id ?? this.user_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'image_url': image_url,
      'user_id': user_id,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory PaymentMethod.fromMap(Map<String, dynamic> map) {
    return PaymentMethod(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      user_id: map['user_id'] != null ? map['user_id'] as int : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethod.fromJson(String source) =>
      PaymentMethod.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentMethod(id: $id, name: $name, description: $description, type: $type, image_url: $image_url, user_id: $user_id, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant PaymentMethod other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.type == type &&
        other.image_url == image_url &&
        other.user_id == user_id &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        type.hashCode ^
        image_url.hashCode ^
        user_id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
