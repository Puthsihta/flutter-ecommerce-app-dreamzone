// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dreamzone/data/models/shop.dart';
import 'package:flutter/foundation.dart';

import 'package:dreamzone/data/models/provinces.dart';

class ShopContainer {
  List<Provinces> provinces;
  List<Shop> shops;

  ShopContainer({
    required this.provinces,
    required this.shops,
  });

  ShopContainer copyWith({
    List<Provinces>? provinces,
    List<Shop>? shops,
  }) {
    return ShopContainer(
      provinces: provinces ?? this.provinces,
      shops: shops ?? this.shops,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'provinces': provinces.map((x) => x.toMap()).toList(),
      'shops': shops.map((x) => x.toMap()).toList(),
    };
  }

  factory ShopContainer.fromMap(Map<String, dynamic> map) {
    return ShopContainer(
      provinces: List<Provinces>.from(
        (map['provinces'] as List<dynamic>).map<Provinces>(
          (x) => Provinces.fromMap(x as Map<String, dynamic>),
        ),
      ),
      shops: List<Shop>.from(
        (map['shops'] as List<dynamic>).map<Shop>(
          (x) => Shop.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopContainer.fromJson(String source) =>
      ShopContainer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShopContainer(provinces: $provinces, shops: $shops)';

  @override
  bool operator ==(covariant ShopContainer other) {
    if (identical(this, other)) return true;

    return listEquals(other.provinces, provinces) &&
        listEquals(other.shops, shops);
  }

  @override
  int get hashCode => provinces.hashCode ^ shops.hashCode;
}
