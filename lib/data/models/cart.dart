// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dreamzone/data/models/product_detail.dart';
import 'package:dreamzone/data/models/shop.dart';

class Cart {
  final Map<String, ShopItem> cart;
  Cart({
    required this.cart,
  });

  Cart copyWith({
    Map<String, ShopItem>? cart,
  }) {
    return Cart(
      cart: cart ?? this.cart,
    );
  }

  factory Cart.fromString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    Map<String, ShopItem> cart = {};

    jsonMap.forEach((key, value) {
      cart[key] = ShopItem.fromString(value);
    });
    return Cart(cart: cart);
  }

  String toJsonString() {
    Map<String, dynamic> jsonMap = {};

    cart.forEach((key, value) {
      jsonMap[key] = value.toJson();
    });

    return jsonEncode(jsonMap);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cart': cart,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      cart: Map<String, ShopItem>.from(
        (map['cart'] as Map<String, ShopItem>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Cart(cart: $cart)';

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return mapEquals(other.cart, cart);
  }

  @override
  int get hashCode => cart.hashCode;
}

class ShopItem {
  Shop? shop;
  final Map<String, ProductItem> product;
  ShopItem({
    this.shop,
    required this.product,
  });

  factory ShopItem.fromString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    Shop? shop = jsonMap['shop'] != null ? Shop.fromMap(jsonMap['shop']) : null;

    Map<String, ProductItem> product = {};

    jsonMap['product'].forEach((key, value) {
      product[key] = ProductItem.fromString(value);
    });

    return ShopItem(shop: shop, product: product);
  }

  String toJsonString() {
    Map<String, dynamic> jsonMap = {};

    if (shop != null) {
      jsonMap['shop'] = shop!.toJson();
    }

    Map<String, dynamic> productMap = {};
    product.forEach((key, value) {
      productMap[key] = value.toJson();
    });

    jsonMap['product'] = productMap;

    return jsonEncode(jsonMap);
  }

  ShopItem copyWith({
    Shop? shop,
    Map<String, ProductItem>? product,
  }) {
    return ShopItem(
      shop: shop ?? this.shop,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shop': shop?.toMap(),
      'product': product,
    };
  }

  factory ShopItem.fromMap(Map<String, dynamic> map) {
    return ShopItem(
      shop: Shop.fromMap(map['shop'] as Map<String, dynamic>),
      product: Map<String, ProductItem>.from(
        (map['product'] as Map<String, ProductItem>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopItem.fromJson(String source) =>
      ShopItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShopItem(shop: $shop, product: $product)';

  @override
  bool operator ==(covariant ShopItem other) {
    if (identical(this, other)) return true;

    return other.shop == shop && mapEquals(other.product, product);
  }

  @override
  int get hashCode => shop.hashCode ^ product.hashCode;
}

class ProductItem {
  final ProductDetail product;
  final int quantity;
  final int discount;
  final double? total;
  ProductItem({
    required this.product,
    required this.quantity,
    required this.discount,
    this.total,
  });

  factory ProductItem.fromString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    return ProductItem(
      product: ProductDetail.fromMap(jsonMap['product']),
      quantity: jsonMap['quantity'],
      discount: jsonMap['discount'],
      total: jsonMap['total'],
    );
  }

  String toJsonString() {
    Map<String, dynamic> jsonMap = {
      'product': product.toJson(),
      'quantity': quantity,
      'discount': discount,
      'total': total,
    };

    return jsonEncode(jsonMap);
  }

  ProductItem copyWith({
    ProductDetail? product,
    int? quantity,
    String? discountType,
    int? discount,
    double? total,
  }) {
    return ProductItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      discount: discount ?? this.discount,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
      'discount': discount,
      'total': total,
    };
  }

  factory ProductItem.fromMap(Map<String, dynamic> map) {
    return ProductItem(
      product: ProductDetail.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
      discount: map['discount'] as int,
      total: map['total'] != null ? map['total'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductItem.fromJson(String source) =>
      ProductItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductItem(product: $product, quantity: $quantity, discount: $discount, total: $total)';
  }

  @override
  bool operator ==(covariant ProductItem other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        other.quantity == quantity &&
        other.discount == discount &&
        other.total == total;
  }

  @override
  int get hashCode {
    return product.hashCode ^
        quantity.hashCode ^
        discount.hashCode ^
        total.hashCode;
  }
}
