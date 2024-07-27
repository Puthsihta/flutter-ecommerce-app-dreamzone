import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int? id;
  String? phone;
  String? name;
  String? email;
  String? role;
  String? image_url;
  User({
    this.id,
    this.phone,
    this.name,
    this.email,
    this.role,
    this.image_url,
  });

  User copyWith({
    int? id,
    String? phone,
    String? name,
    String? email,
    String? role,
    String? image_url,
  }) {
    return User(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      image_url: image_url ?? this.image_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phone': phone,
      'name': name,
      'email': email,
      'role': role,
      'image_url': image_url,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, phone: $phone, name: $name, email: $email, role: $role, image_url: $image_url)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.phone == phone &&
        other.name == name &&
        other.email == email &&
        other.role == role &&
        other.image_url == image_url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        phone.hashCode ^
        name.hashCode ^
        email.hashCode ^
        role.hashCode ^
        image_url.hashCode;
  }
}
