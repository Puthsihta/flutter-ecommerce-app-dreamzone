import 'dart:convert';

import 'package:dreamzone/data/models/category.dart';

class Product {
  final int id;
  final String name_en;
  final String? name_kh;
  final String? img_url;
  final String? thumbnail_url;
  final num price;
  final String barcode;
  final int? category_id;
  final int created_by;
  final DateTime? deleted_at;
  final DateTime created_at;
  final DateTime? updated_at;
  final Category? category;

  Product({
    required this.id,
    required this.name_en,
    this.name_kh,
    this.img_url,
    this.thumbnail_url,
    required this.price,
    required this.barcode,
    this.category_id,
    required this.created_by,
    this.deleted_at,
    required this.created_at,
    required this.updated_at,
    this.category,
  });

  Product copyWith({
    int? id,
    String? name_en,
    String? name_kh,
    String? img_url,
    String? thumbnail_url,
    num? price,
    String? barcode,
    int? category_id,
    int? created_by,
    DateTime? deleted_at,
    DateTime? created_at,
    DateTime? updated_at,
    Category? category,
  }) {
    return Product(
      id: id ?? this.id,
      name_en: name_en ?? this.name_en,
      name_kh: name_kh ?? this.name_kh,
      img_url: img_url ?? this.img_url,
      thumbnail_url: thumbnail_url ?? this.thumbnail_url,
      price: price ?? this.price,
      barcode: barcode ?? this.barcode,
      category_id: category_id ?? this.category_id,
      created_by: created_by ?? this.created_by,
      deleted_at: deleted_at ?? this.deleted_at,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_en': name_en,
      'name_kh': name_kh,
      'img_url': img_url,
      'thumbnail_url': thumbnail_url,
      'price': price,
      'barcode': barcode,
      'category_id': category_id,
      'created_by': created_by,
      'deleted_at': deleted_at?.toString(),
      'created_at': created_at.toString(),
      'updated_at': updated_at.toString(),
      'category': category?.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name_en: map['name_en'] as String,
      name_kh: map['name_kh'] != null ? map['name_kh'] as String : null,
      img_url: map['img_url'] != null ? map['img_url'] as String : null,
      thumbnail_url:
          map['thumbnail_url'] != null ? map['thumbnail_url'] as String : null,
      price: map['price'] as num,
      barcode: map['barcode'] as String,
      category_id:
          map['category_id'] != null ? map['category_id'] as int : null,
      created_by: map['created_by'] as int,
      deleted_at: map['deleted_at'] != null
          ? DateTime.parse(map['deleted_at'] as String)
          : null,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
      category: map['category'] != null
          ? Category.fromMap(map['category'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name_en: $name_en, name_kh: $name_kh, img_url: $img_url, thumbnail_url: $thumbnail_url, price: $price, barcode: $barcode, category_id: $category_id, created_by: $created_by, deleted_at: $deleted_at, created_at: $created_at, updated_at: $updated_at, category: $category)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name_en == name_en &&
        other.name_kh == name_kh &&
        other.img_url == img_url &&
        other.thumbnail_url == thumbnail_url &&
        other.price == price &&
        other.barcode == barcode &&
        other.category_id == category_id &&
        other.created_by == created_by &&
        other.deleted_at == deleted_at &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name_en.hashCode ^
        name_kh.hashCode ^
        img_url.hashCode ^
        thumbnail_url.hashCode ^
        price.hashCode ^
        barcode.hashCode ^
        category_id.hashCode ^
        created_by.hashCode ^
        deleted_at.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        category.hashCode;
  }
}
