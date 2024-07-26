// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dreamzone/data/models/product.dart';
import 'package:flutter/foundation.dart';

import 'package:dreamzone/data/models/shop.dart';

class ShopContainDetail {
  Shop? shop;
  List<Product>? products;

  ShopContainDetail({
    this.shop,
    this.products,
  });

  ShopContainDetail copyWith({
    Shop? shop,
    List<Product>? products,
  }) {
    return ShopContainDetail(
      shop: shop ?? this.shop,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shop': shop?.toMap(),
      'products': products?.map((x) => x.toMap()).toList(),
    };
  }

  factory ShopContainDetail.fromMap(Map<String, dynamic> map) {
    return ShopContainDetail(
      shop: map['shop'] != null
          ? Shop.fromMap(map['shop'] as Map<String, dynamic>)
          : null,
      products: map['products'] != null
          ? List<Product>.from(
              (map['products'] as List<dynamic>).map<Product?>(
                (x) => Product.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopContainDetail.fromJson(String source) =>
      ShopContainDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShopContainDetail(shop: $shop, products: $products)';

  @override
  bool operator ==(covariant ShopContainDetail other) {
    if (identical(this, other)) return true;

    return other.shop == shop && listEquals(other.products, products);
  }

  @override
  int get hashCode => shop.hashCode ^ products.hashCode;
}
