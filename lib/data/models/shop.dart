import 'dart:convert';

import 'package:dreamzone/data/models/address.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class Shop {
  int? id;
  String? name;
  String? description;
  String? phone;
  String? email;
  int? address_id;
  int? province_id;
  int? user_id;
  bool? is_active;
  String? cover_image;
  String? logo_image;
  bool? is_favorite;
  bool? is_features_shop;
  bool? is_new;
  bool? is_promotion;
  dynamic open_time;
  dynamic open_week;
  dynamic freight;
  String? merchant_type;
  String? createdAt;
  String? updatedAt;
  dynamic promotion;
  Address? address;

  Shop({
    this.id,
    this.name,
    this.description,
    this.phone,
    this.email,
    this.address_id,
    this.province_id,
    this.user_id,
    this.is_active,
    this.cover_image,
    this.logo_image,
    this.is_favorite,
    this.is_features_shop,
    this.is_new,
    this.is_promotion,
    this.open_time,
    this.open_week,
    this.freight,
    this.merchant_type,
    this.createdAt,
    this.updatedAt,
    this.promotion,
    this.address,
  });

  Shop copyWith({
    int? id,
    String? name,
    String? description,
    String? phone,
    String? email,
    int? address_id,
    int? province_id,
    int? user_id,
    bool? is_active,
    String? cover_image,
    String? logo_image,
    bool? is_favorite,
    bool? is_features_shop,
    bool? is_new,
    bool? is_promotion,
    dynamic open_time,
    dynamic open_week,
    dynamic freight,
    String? merchant_type,
    String? createdAt,
    String? updatedAt,
    dynamic promotion,
    Address? address,
  }) {
    return Shop(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address_id: address_id ?? this.address_id,
      province_id: province_id ?? this.province_id,
      user_id: user_id ?? this.user_id,
      is_active: is_active ?? this.is_active,
      cover_image: cover_image ?? this.cover_image,
      logo_image: logo_image ?? this.logo_image,
      is_favorite: is_favorite ?? this.is_favorite,
      is_features_shop: is_features_shop ?? this.is_features_shop,
      is_new: is_new ?? this.is_new,
      is_promotion: is_promotion ?? this.is_promotion,
      open_time: open_time ?? this.open_time,
      open_week: open_week ?? this.open_week,
      freight: freight ?? this.freight,
      merchant_type: merchant_type ?? this.merchant_type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      promotion: promotion ?? this.promotion,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'phone': phone,
      'email': email,
      'address_id': address_id,
      'province_id': province_id,
      'user_id': user_id,
      'is_active': is_active,
      'cover_image': cover_image,
      'logo_image': logo_image,
      'is_favorite': is_favorite,
      'is_features_shop': is_features_shop,
      'is_new': is_new,
      'is_promotion': is_promotion,
      'open_time': open_time,
      'open_week': open_week,
      'freight': freight,
      'merchant_type': merchant_type,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'promotion': promotion,
      'address': address?.toMap(),
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      address_id: map['address_id'] != null ? map['address_id'] as int : null,
      province_id:
          map['province_id'] != null ? map['province_id'] as int : null,
      user_id: map['user_id'] != null ? map['user_id'] as int : null,
      is_active: map['is_active'] != null ? map['is_active'] as bool : null,
      cover_image:
          map['cover_image'] != null ? map['cover_image'] as String : null,
      logo_image:
          map['logo_image'] != null ? map['logo_image'] as String : null,
      is_favorite:
          map['is_favorite'] != null ? map['is_favorite'] as bool : null,
      is_features_shop: map['is_features_shop'] != null
          ? map['is_features_shop'] as bool
          : null,
      is_new: map['is_new'] != null ? map['is_new'] as bool : null,
      is_promotion:
          map['is_promotion'] != null ? map['is_promotion'] as bool : null,
      open_time: map['open_time'] as dynamic,
      open_week: map['open_week'] as dynamic,
      freight: map['freight'] as dynamic,
      merchant_type:
          map['merchant_type'] != null ? map['merchant_type'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      promotion: map['promotion'] as dynamic,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) =>
      Shop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Shop(id: $id, name: $name, description: $description, phone: $phone, email: $email, address_id: $address_id, province_id: $province_id, user_id: $user_id, is_active: $is_active, cover_image: $cover_image, logo_image: $logo_image, is_favorite: $is_favorite, is_features_shop: $is_features_shop, is_new: $is_new, is_promotion: $is_promotion, open_time: $open_time, open_week: $open_week, freight: $freight, merchant_type: $merchant_type, createdAt: $createdAt, updatedAt: $updatedAt, promotion: $promotion, address: $address)';
  }

  @override
  bool operator ==(covariant Shop other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.phone == phone &&
        other.email == email &&
        other.address_id == address_id &&
        other.province_id == province_id &&
        other.user_id == user_id &&
        other.is_active == is_active &&
        other.cover_image == cover_image &&
        other.logo_image == logo_image &&
        other.is_favorite == is_favorite &&
        other.is_features_shop == is_features_shop &&
        other.is_new == is_new &&
        other.is_promotion == is_promotion &&
        other.open_time == open_time &&
        other.open_week == open_week &&
        other.freight == freight &&
        other.merchant_type == merchant_type &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.promotion == promotion &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        address_id.hashCode ^
        province_id.hashCode ^
        user_id.hashCode ^
        is_active.hashCode ^
        cover_image.hashCode ^
        logo_image.hashCode ^
        is_favorite.hashCode ^
        is_features_shop.hashCode ^
        is_new.hashCode ^
        is_promotion.hashCode ^
        open_time.hashCode ^
        open_week.hashCode ^
        freight.hashCode ^
        merchant_type.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        promotion.hashCode ^
        address.hashCode;
  }
}
