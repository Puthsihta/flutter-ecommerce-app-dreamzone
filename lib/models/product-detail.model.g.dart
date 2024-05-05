// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product-detail.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) =>
    ProductDetail(
      id: (json['id'] as num).toInt(),
      shop_id: (json['shop_id'] as num?)?.toInt(),
      category_id: (json['category_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shop_id': instance.shop_id,
      'category_id': instance.category_id,
    };
