// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class User {
  int id;
  String name;
  String phone;
  String? img_url;
  String role;
  String status;
  int created_by;
  String created_at;
  String updated_at;
  String? thumbnail_url;
  User({
    required this.id,
    required this.name,
    required this.phone,
    this.img_url,
    required this.role,
    required this.status,
    required this.created_by,
    required this.created_at,
    required this.updated_at,
    this.thumbnail_url,
  });

  User copyWith({
    int? id,
    String? name,
    String? phone,
    String? img_url,
    String? role,
    String? status,
    int? created_by,
    String? created_at,
    String? updated_at,
    String? thumbnail_url,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      img_url: img_url ?? this.img_url,
      role: role ?? this.role,
      status: status ?? this.status,
      created_by: created_by ?? this.created_by,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      thumbnail_url: thumbnail_url ?? this.thumbnail_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'img_url': img_url,
      'role': role,
      'status': status,
      'created_by': created_by,
      'created_at': created_at,
      'updated_at': updated_at,
      'thumbnail_url': thumbnail_url,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      phone: map['phone'] as String,
      img_url: map['img_url'] != null ? map['img_url'] as String : null,
      role: map['role'] as String,
      status: map['status'] as String,
      created_by: map['created_by'] as int,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      thumbnail_url:
          map['thumbnail_url'] != null ? map['thumbnail_url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, phone: $phone, img_url: $img_url, role: $role, status: $status, created_by: $created_by, created_at: $created_at, updated_at: $updated_at, thumbnail_url: $thumbnail_url)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.img_url == img_url &&
        other.role == role &&
        other.status == status &&
        other.created_by == created_by &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.thumbnail_url == thumbnail_url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        img_url.hashCode ^
        role.hashCode ^
        status.hashCode ^
        created_by.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        thumbnail_url.hashCode;
  }
}
