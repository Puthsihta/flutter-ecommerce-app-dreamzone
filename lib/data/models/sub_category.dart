import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SubCategories {
  int? id;
  String? name;
  String? description;
  String? image_url;
  int? cate_id;
  String? createdAt;
  String? updatedAt;

  SubCategories({
    this.id,
    this.name,
    this.description,
    this.image_url,
    this.cate_id,
    this.createdAt,
    this.updatedAt,
  });

  SubCategories copyWith({
    int? id,
    String? name,
    String? description,
    String? image_url,
    int? cate_id,
    String? createdAt,
    String? updatedAt,
  }) {
    return SubCategories(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image_url: image_url ?? this.image_url,
      cate_id: cate_id ?? this.cate_id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image_url': image_url,
      'cate_id': cate_id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory SubCategories.fromMap(Map<String, dynamic> map) {
    return SubCategories(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      cate_id: map['cate_id'] != null ? map['cate_id'] as int : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategories.fromJson(String source) =>
      SubCategories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubCategories(id: $id, name: $name, description: $description, image_url: $image_url, cate_id: $cate_id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant SubCategories other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.image_url == image_url &&
        other.cate_id == cate_id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        image_url.hashCode ^
        cate_id.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
