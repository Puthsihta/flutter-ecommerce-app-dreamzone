// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Shop {
  int id;
  String? name;
  int? created_by;
  String? created_at;
  String? updated_at;
  Shop({
    required this.id,
    this.name,
    this.created_by,
    this.created_at,
    this.updated_at,
  });

  Shop copyWith({
    int? id,
    String? name,
    int? created_by,
    String? created_at,
    String? updated_at,
  }) {
    return Shop(
      id: id ?? this.id,
      name: name ?? this.name,
      created_by: created_by ?? this.created_by,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created_by': created_by,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      created_by: map['created_by'] != null ? map['created_by'] as int : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) =>
      Shop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Shop(id: $id, name: $name, created_by: $created_by, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Shop other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.created_by == created_by &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        created_by.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
