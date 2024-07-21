import 'dart:convert';

class Category {
  final int? id;
  final String name;
  final String? img_url;
  final String? thumbnail_url;
  final int? created_by;
  final DateTime created_at;
  final DateTime? updated_at;
  final DateTime? deleted_at;

  Category({
    required this.id,
    required this.name,
    this.img_url,
    this.thumbnail_url,
    this.created_by,
    required this.created_at,
    required this.updated_at,
    this.deleted_at,
  });

  Category copyWith({
    int? id,
    String? name,
    String? img_url,
    String? thumbnail_url,
    int? created_by,
    DateTime? created_at,
    DateTime? updated_at,
    DateTime? deleted_at,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      img_url: img_url ?? this.img_url,
      thumbnail_url: thumbnail_url ?? this.thumbnail_url,
      created_by: created_by ?? this.created_by,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'img_url': img_url,
      'thumbnail_url': thumbnail_url,
      'created_by': created_by,
      'created_at': created_at.toString(),
      'updated_at': updated_at.toString(),
      'deleted_at': deleted_at?.toString(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      img_url: map['img_url'] != null ? map['img_url'] as String : null,
      thumbnail_url:
          map['thumbnail_url'] != null ? map['thumbnail_url'] as String : null,
      created_by: map['created_by'] != null ? map['created_by'] as int : null,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
      deleted_at: map['deleted_at'] != null
          ? DateTime.parse(map['deleted_at'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, name: $name, img_url: $img_url, thumbnail_url: $thumbnail_url, created_by: $created_by, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.img_url == img_url &&
        other.thumbnail_url == thumbnail_url &&
        other.created_by == created_by &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.deleted_at == deleted_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        img_url.hashCode ^
        thumbnail_url.hashCode ^
        created_by.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        deleted_at.hashCode;
  }
}
