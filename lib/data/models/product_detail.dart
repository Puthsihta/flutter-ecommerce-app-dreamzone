// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/data/models/shop.dart';

class ProductDetailContainer {
  ProductDetail? productDetail;
  List<Product>? relateProducts;

  ProductDetailContainer({
    this.productDetail,
    this.relateProducts,
  });

  ProductDetailContainer copyWith({
    ProductDetail? productDetail,
    List<Product>? relateProducts,
  }) {
    return ProductDetailContainer(
      productDetail: productDetail ?? this.productDetail,
      relateProducts: relateProducts ?? this.relateProducts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productDetail': productDetail?.toMap(),
      'relateProducts': relateProducts?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductDetailContainer.fromMap(Map<String, dynamic> map) {
    return ProductDetailContainer(
      productDetail: map['product'] != null
          ? ProductDetail.fromMap(map['product'] as Map<String, dynamic>)
          : null,
      relateProducts: map['relate_product'] != null
          ? List<Product>.from(
              (map['relate_product'] as List<dynamic>).map<Product?>(
                (x) => Product.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetailContainer.fromJson(String source) =>
      ProductDetailContainer.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductDetailContainer(productDetail: $productDetail, relateProducts: $relateProducts)';

  @override
  bool operator ==(covariant ProductDetailContainer other) {
    if (identical(this, other)) return true;

    return other.productDetail == productDetail &&
        listEquals(other.relateProducts, relateProducts);
  }

  @override
  int get hashCode => productDetail.hashCode ^ relateProducts.hashCode;
}

class ProductDetail {
  int? id;
  int? cate_id;
  int? sub_cate_id;
  int? shop_id;
  String? name;
  String? description;
  String? price;
  String? image_url;
  bool? is_favorite;
  bool? is_best_salling;
  int? discount;
  int? follow_shop_discount;
  String? createdAt;
  String? updatedAt;
  Shop? shop;

  ProductDetail({
    this.id,
    this.cate_id,
    this.sub_cate_id,
    this.shop_id,
    this.name,
    this.description,
    this.price,
    this.image_url,
    this.is_favorite,
    this.is_best_salling,
    this.discount,
    this.follow_shop_discount,
    this.createdAt,
    this.updatedAt,
    this.shop,
  });

  ProductDetail copyWith({
    int? id,
    int? cate_id,
    int? sub_cate_id,
    int? shop_id,
    String? name,
    String? description,
    String? price,
    String? image_url,
    bool? is_favorite,
    bool? is_best_salling,
    int? discount,
    int? follow_shop_discount,
    String? createdAt,
    String? updatedAt,
    Shop? shop,
  }) {
    return ProductDetail(
      id: id ?? this.id,
      cate_id: cate_id ?? this.cate_id,
      sub_cate_id: sub_cate_id ?? this.sub_cate_id,
      shop_id: shop_id ?? this.shop_id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image_url: image_url ?? this.image_url,
      is_favorite: is_favorite ?? this.is_favorite,
      is_best_salling: is_best_salling ?? this.is_best_salling,
      discount: discount ?? this.discount,
      follow_shop_discount: follow_shop_discount ?? this.follow_shop_discount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      shop: shop ?? this.shop,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cate_id': cate_id,
      'sub_cate_id': sub_cate_id,
      'shop_id': shop_id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': image_url,
      'is_favorite': is_favorite,
      'is_best_salling': is_best_salling,
      'discount': discount,
      'follow_shop_discount': follow_shop_discount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'shop': shop?.toMap(),
    };
  }

  factory ProductDetail.fromMap(Map<String, dynamic> map) {
    return ProductDetail(
      id: map['id'] != null ? map['id'] as int : null,
      cate_id: map['cate_id'] != null ? map['cate_id'] as int : null,
      sub_cate_id:
          map['sub_cate_id'] != null ? map['sub_cate_id'] as int : null,
      shop_id: map['shop_id'] != null ? map['shop_id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      is_favorite:
          map['is_favorite'] != null ? map['is_favorite'] as bool : null,
      is_best_salling: map['is_best_salling'] != null
          ? map['is_best_salling'] as bool
          : null,
      discount: map['discount'] != null ? map['discount'] as int : null,
      follow_shop_discount: map['follow_shop_discount'] != null
          ? map['follow_shop_discount'] as int
          : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      shop: map['shop'] != null
          ? Shop.fromMap(map['shop'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetail.fromJson(String source) =>
      ProductDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDetail(id: $id, cate_id: $cate_id, sub_cate_id: $sub_cate_id, shop_id: $shop_id, name: $name, description: $description, price: $price, image_url: $image_url, is_favorite: $is_favorite, is_best_salling: $is_best_salling, discount: $discount, follow_shop_discount: $follow_shop_discount, createdAt: $createdAt, updatedAt: $updatedAt, shop: $shop)';
  }

  @override
  bool operator ==(covariant ProductDetail other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.cate_id == cate_id &&
        other.sub_cate_id == sub_cate_id &&
        other.shop_id == shop_id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.image_url == image_url &&
        other.is_favorite == is_favorite &&
        other.is_best_salling == is_best_salling &&
        other.discount == discount &&
        other.follow_shop_discount == follow_shop_discount &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.shop == shop;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cate_id.hashCode ^
        sub_cate_id.hashCode ^
        shop_id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        image_url.hashCode ^
        is_favorite.hashCode ^
        is_best_salling.hashCode ^
        discount.hashCode ^
        follow_shop_discount.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        shop.hashCode;
  }
}
