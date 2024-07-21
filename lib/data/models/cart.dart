// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dreamzone/data/models/product.dart';
import 'package:flutter/foundation.dart';

class Cart {
  final Map<int, CartItem> cart;
  Cart({
    required this.cart,
  });

  Cart copyWith({
    Map<int, CartItem>? cart,
  }) {
    return Cart(
      cart: cart ?? this.cart,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cart': cart,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
        cart: Map<int, CartItem>.from(
      (map['cart'] as Map<int, CartItem>),
    ));
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

class CartItem {
  final Product product;
  final int quantity;
  final String discountType;
  final double discount;
  final double? total;
  CartItem(
      {required this.product,
      required this.quantity,
      required this.discountType,
      required this.discount,
      this.total});

  CartItem copyWith({
    Product? product,
    int? quantity,
    String? discountType,
    double? discount,
    double? total,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      discountType: discountType ?? this.discountType,
      discount: discount ?? this.discount,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
      'discountType': discountType,
      'discount': discount,
      'total': total,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
      discountType: map['discountType'] as String,
      discount: map['discount'] as double,
      total: map['total'] != null ? map['total'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartItem(product: $product, quantity: $quantity, discountType: $discountType, discount: $discount, total: $total)';
  }

  @override
  bool operator ==(covariant CartItem other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        other.quantity == quantity &&
        other.discountType == discountType &&
        other.discount == discount &&
        other.total == total;
  }

  @override
  int get hashCode {
    return product.hashCode ^
        quantity.hashCode ^
        discountType.hashCode ^
        discount.hashCode ^
        total.hashCode;
  }
}
