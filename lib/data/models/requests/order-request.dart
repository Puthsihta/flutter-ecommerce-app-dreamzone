import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RequestOrder {
  int address_id;
  int payment_id;
  int shop_id;
  String? remarks;
  List<ProductOrder> product;

  RequestOrder({
    required this.address_id,
    required this.payment_id,
    required this.shop_id,
    this.remarks,
    required this.product,
  });

  RequestOrder copyWith({
    int? address_id,
    int? payment_id,
    int? shop_id,
    String? remarks,
    List<ProductOrder>? product,
  }) {
    return RequestOrder(
      address_id: address_id ?? this.address_id,
      payment_id: payment_id ?? this.payment_id,
      shop_id: shop_id ?? this.shop_id,
      remarks: remarks ?? this.remarks,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address_id': address_id,
      'payment_id': payment_id,
      'shop_id': shop_id,
      'remarks': remarks,
      'product': product.map((x) => x.toMap()).toList(),
    };
  }

  factory RequestOrder.fromMap(Map<String, dynamic> map) {
    return RequestOrder(
      address_id: map['address_id'] as int,
      payment_id: map['payment_id'] as int,
      shop_id: map['shop_id'] as int,
      remarks: map['remarks'] != null ? map['remarks'] as String : null,
      product: List<ProductOrder>.from(
        (map['product'] as List<int>).map<ProductOrder>(
          (x) => ProductOrder.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestOrder.fromJson(String source) =>
      RequestOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RequestOrder(address_id: $address_id, payment_id: $payment_id, shop_id: $shop_id, remarks: $remarks, product: $product)';
  }

  @override
  bool operator ==(covariant RequestOrder other) {
    if (identical(this, other)) return true;

    return other.address_id == address_id &&
        other.payment_id == payment_id &&
        other.shop_id == shop_id &&
        other.remarks == remarks &&
        listEquals(other.product, product);
  }

  @override
  int get hashCode {
    return address_id.hashCode ^
        payment_id.hashCode ^
        shop_id.hashCode ^
        remarks.hashCode ^
        product.hashCode;
  }
}

class ProductOrder {
  int id;
  int quantity;
  String? noted;

  ProductOrder({
    required this.id,
    required this.quantity,
    this.noted,
  });

  ProductOrder copyWith({
    int? id,
    int? quantity,
    String? noted,
  }) {
    return ProductOrder(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      noted: noted ?? this.noted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      'noted': noted,
    };
  }

  factory ProductOrder.fromMap(Map<String, dynamic> map) {
    return ProductOrder(
      id: map['id'] as int,
      quantity: map['quantity'] as int,
      noted: map['noted'] != null ? map['noted'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductOrder.fromJson(String source) =>
      ProductOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductOrder(id: $id, quantity: $quantity, noted: $noted)';

  @override
  bool operator ==(covariant ProductOrder other) {
    if (identical(this, other)) return true;

    return other.id == id && other.quantity == quantity && other.noted == noted;
  }

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode ^ noted.hashCode;
}
