// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderList {
  int? id;
  int? userId;
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

  OrderList({
    this.id,
    this.userId,
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
  });

  OrderList copyWith({
    int? id,
    int? userId,
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
  }) {
    return OrderList(
      id: id ?? this.id,
      userId: userId ?? this.userId,
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
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
    };
  }

  factory OrderList.fromMap(Map<String, dynamic> map) {
    return OrderList(
      id: map['id'] != null ? map['id'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderList.fromJson(String source) =>
      OrderList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderList(id: $id, userId: $userId, total: $total, sub_total: $sub_total, total_discount: $total_discount, total_item: $total_item, invoice_no: $invoice_no, remarks: $remarks, shop_id: $shop_id, address_id: $address_id, payment_id: $payment_id, status: $status, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant OrderList other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
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
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
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
        updated_at.hashCode;
  }
}
