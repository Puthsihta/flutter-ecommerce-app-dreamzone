// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dreamzone/data/models/shop.dart';

class PromotionShop {
  int? id;
  String? lable;
  int? promotion;
  String? start_date;
  String? end_date;
  int? shop_id;
  String? created_at;
  String? updated_at;

  Shop shop;
  PromotionShop({
    this.id,
    this.lable,
    this.promotion,
    this.start_date,
    this.end_date,
    this.shop_id,
    this.created_at,
    this.updated_at,
    required this.shop,
  });

  PromotionShop copyWith({
    int? id,
    String? lable,
    int? promotion,
    String? start_date,
    String? end_date,
    int? shop_id,
    String? created_at,
    String? updated_at,
    Shop? shop,
  }) {
    return PromotionShop(
      id: id ?? this.id,
      lable: lable ?? this.lable,
      promotion: promotion ?? this.promotion,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      shop_id: shop_id ?? this.shop_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      shop: shop ?? this.shop,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'lable': lable,
      'promotion': promotion,
      'start_date': start_date,
      'end_date': end_date,
      'shop_id': shop_id,
      'created_at': created_at,
      'updated_at': updated_at,
      'shop': shop.toMap(),
    };
  }

  factory PromotionShop.fromMap(Map<String, dynamic> map) {
    return PromotionShop(
      id: map['id'] != null ? map['id'] as int : null,
      lable: map['lable'] != null ? map['lable'] as String : null,
      promotion: map['promotion'] != null ? map['promotion'] as int : null,
      start_date:
          map['start_date'] != null ? map['start_date'] as String : null,
      end_date: map['end_date'] != null ? map['end_date'] as String : null,
      shop_id: map['shop_id'] != null ? map['shop_id'] as int : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
      shop: Shop.fromMap(map['shop'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PromotionShop.fromJson(String source) =>
      PromotionShop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PromotionShop(id: $id, lable: $lable, promotion: $promotion, start_date: $start_date, end_date: $end_date, shop_id: $shop_id, created_at: $created_at, updated_at: $updated_at, shop: $shop)';
  }

  @override
  bool operator ==(covariant PromotionShop other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.lable == lable &&
        other.promotion == promotion &&
        other.start_date == start_date &&
        other.end_date == end_date &&
        other.shop_id == shop_id &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.shop == shop;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lable.hashCode ^
        promotion.hashCode ^
        start_date.hashCode ^
        end_date.hashCode ^
        shop_id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        shop.hashCode;
  }
}
