// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dreamzone/data/models/address.dart';
import 'package:dreamzone/data/models/payment-method.dart';
import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/data/models/shop.dart';
import 'package:dreamzone/data/models/user.dart';

class OrderDetail {
  int? id;
  int? user_id;
  String? total;
  String? sub_total;
  String? total_discount;
  int? total_item;
  String? invoice_no;
  String? remarks;
  int? shop_id;
  int? address_id;
  int? payment_id;
  int? status;
  String? created_at;
  String? updated_at;

  User? user;
  Address? address;
  Shop? shop;
  PaymentMethod? payment_method;
  List<ProductOrderDetail>? product_data;

  OrderDetail({
    this.id,
    this.user_id,
    this.total,
    this.sub_total,
    this.total_discount,
    this.total_item,
    this.invoice_no,
    this.remarks,
    this.shop_id,
    this.address_id,
    this.payment_id,
    this.status,
    this.created_at,
    this.updated_at,
    this.user,
    this.address,
    this.shop,
    this.payment_method,
    this.product_data,
  });

  OrderDetail copyWith({
    int? id,
    int? user_id,
    String? total,
    String? sub_total,
    String? total_discount,
    int? total_item,
    String? invoice_no,
    String? remarks,
    int? shop_id,
    int? address_id,
    int? payment_id,
    int? status,
    String? created_at,
    String? updated_at,
    User? user,
    Address? address,
    Shop? shop,
    PaymentMethod? payment_method,
    List<ProductOrderDetail>? product_data,
  }) {
    return OrderDetail(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      total: total ?? this.total,
      sub_total: sub_total ?? this.sub_total,
      total_discount: total_discount ?? this.total_discount,
      total_item: total_item ?? this.total_item,
      invoice_no: invoice_no ?? this.invoice_no,
      remarks: remarks ?? this.remarks,
      shop_id: shop_id ?? this.shop_id,
      address_id: address_id ?? this.address_id,
      payment_id: payment_id ?? this.payment_id,
      status: status ?? this.status,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      user: user ?? this.user,
      address: address ?? this.address,
      shop: shop ?? this.shop,
      payment_method: payment_method ?? this.payment_method,
      product_data: product_data ?? this.product_data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'total': total,
      'sub_total': sub_total,
      'total_discount': total_discount,
      'total_item': total_item,
      'invoice_no': invoice_no,
      'remarks': remarks,
      'shop_id': shop_id,
      'address_id': address_id,
      'payment_id': payment_id,
      'status': status,
      'created_at': created_at,
      'updated_at': updated_at,
      'user': user?.toMap(),
      'address': address?.toMap(),
      'shop': shop?.toMap(),
      'payment_method': payment_method?.toMap(),
      'product_data': product_data?.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderDetail.fromMap(Map<String, dynamic> map) {
    return OrderDetail(
      id: map['id'] != null ? map['id'] as int : null,
      user_id: map['user_id'] != null ? map['user_id'] as int : null,
      total: map['total'] != null ? map['total'] as String : null,
      sub_total: map['sub_total'] != null ? map['sub_total'] as String : null,
      total_discount: map['total_discount'] != null
          ? map['total_discount'] as String
          : null,
      total_item: map['total_item'] != null ? map['total_item'] as int : null,
      invoice_no:
          map['invoice_no'] != null ? map['invoice_no'] as String : null,
      remarks: map['remarks'] != null ? map['remarks'] as String : null,
      shop_id: map['shop_id'] != null ? map['shop_id'] as int : null,
      address_id: map['address_id'] != null ? map['address_id'] as int : null,
      payment_id: map['payment_id'] != null ? map['payment_id'] as int : null,
      status: map['status'] != null ? map['status'] as int : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
      user: map['user'] != null
          ? User.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      shop: map['shop'] != null
          ? Shop.fromMap(map['shop'] as Map<String, dynamic>)
          : null,
      payment_method: map['payment_method'] != null
          ? PaymentMethod.fromMap(map['payment_method'] as Map<String, dynamic>)
          : null,
      product_data: map['product_data'] != null
          ? List<ProductOrderDetail>.from(
              (map['product_data'] as List<dynamic>).map<ProductOrderDetail?>(
                (x) => ProductOrderDetail.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromJson(String source) =>
      OrderDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderDetail(id: $id, user_id: $user_id, total: $total, sub_total: $sub_total, total_discount: $total_discount, total_item: $total_item, invoice_no: $invoice_no, remarks: $remarks, shop_id: $shop_id, address_id: $address_id, payment_id: $payment_id, status: $status, created_at: $created_at, updated_at: $updated_at, user: $user, address: $address, shop: $shop, payment_method: $payment_method, product_data: $product_data)';
  }

  @override
  bool operator ==(covariant OrderDetail other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user_id == user_id &&
        other.total == total &&
        other.sub_total == sub_total &&
        other.total_discount == total_discount &&
        other.total_item == total_item &&
        other.invoice_no == invoice_no &&
        other.remarks == remarks &&
        other.shop_id == shop_id &&
        other.address_id == address_id &&
        other.payment_id == payment_id &&
        other.status == status &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.user == user &&
        other.address == address &&
        other.shop == shop &&
        other.payment_method == payment_method &&
        listEquals(other.product_data, product_data);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        total.hashCode ^
        sub_total.hashCode ^
        total_discount.hashCode ^
        total_item.hashCode ^
        invoice_no.hashCode ^
        remarks.hashCode ^
        shop_id.hashCode ^
        address_id.hashCode ^
        payment_id.hashCode ^
        status.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        user.hashCode ^
        address.hashCode ^
        shop.hashCode ^
        payment_method.hashCode ^
        product_data.hashCode;
  }
}

class ProductOrderDetail {
  int? id;
  int? order_id;
  int? product_id;
  int? quantity;
  String? sub_total;
  String? sub_total_discount;
  String? noted;
  String? created_at;
  String? updated_at;

  Product? product;
  ProductOrderDetail({
    this.id,
    this.order_id,
    this.product_id,
    this.quantity,
    this.sub_total,
    this.sub_total_discount,
    this.noted,
    this.created_at,
    this.updated_at,
    this.product,
  });

  ProductOrderDetail copyWith({
    int? id,
    int? order_id,
    int? product_id,
    int? quantity,
    String? sub_total,
    String? sub_total_discount,
    String? noted,
    String? created_at,
    String? updated_at,
    Product? product,
  }) {
    return ProductOrderDetail(
      id: id ?? this.id,
      order_id: order_id ?? this.order_id,
      product_id: product_id ?? this.product_id,
      quantity: quantity ?? this.quantity,
      sub_total: sub_total ?? this.sub_total,
      sub_total_discount: sub_total_discount ?? this.sub_total_discount,
      noted: noted ?? this.noted,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order_id': order_id,
      'product_id': product_id,
      'quantity': quantity,
      'sub_total': sub_total,
      'sub_total_discount': sub_total_discount,
      'noted': noted,
      'created_at': created_at,
      'updated_at': updated_at,
      'product': product?.toMap(),
    };
  }

  factory ProductOrderDetail.fromMap(Map<String, dynamic> map) {
    return ProductOrderDetail(
      id: map['id'] != null ? map['id'] as int : null,
      order_id: map['order_id'] != null ? map['order_id'] as int : null,
      product_id: map['product_id'] != null ? map['product_id'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      sub_total: map['sub_total'] != null ? map['sub_total'] as String : null,
      sub_total_discount: map['sub_total_discount'] != null
          ? map['sub_total_discount'] as String
          : null,
      noted: map['noted'] != null ? map['noted'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
      product: map['product'] != null
          ? Product.fromMap(map['product'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductOrderDetail.fromJson(String source) =>
      ProductOrderDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductOrderDetail(id: $id, order_id: $order_id, product_id: $product_id, quantity: $quantity, sub_total: $sub_total, sub_total_discount: $sub_total_discount, noted: $noted, created_at: $created_at, updated_at: $updated_at, product: $product)';
  }

  @override
  bool operator ==(covariant ProductOrderDetail other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.order_id == order_id &&
        other.product_id == product_id &&
        other.quantity == quantity &&
        other.sub_total == sub_total &&
        other.sub_total_discount == sub_total_discount &&
        other.noted == noted &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.product == product;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        order_id.hashCode ^
        product_id.hashCode ^
        quantity.hashCode ^
        sub_total.hashCode ^
        sub_total_discount.hashCode ^
        noted.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        product.hashCode;
  }
}
