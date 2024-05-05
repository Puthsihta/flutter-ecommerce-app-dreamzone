// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedProduct _$RelatedProductFromJson(Map<String, dynamic> json) =>
    RelatedProduct(
      id: (json['id'] as num).toInt(),
      shopId: json['shopId'] as String,
      name: json['name'] as String,
      price: json['price'] as num,
      discount: (json['discount'] as num).toInt(),
      discountType: json['discountType'] as String,
      startDiscount: json['startDiscount'] as String?,
    );

Map<String, dynamic> _$RelatedProductToJson(RelatedProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopId': instance.shopId,
      'name': instance.name,
      'price': instance.price,
      'discount': instance.discount,
      'discountType': instance.discountType,
      'startDiscount': instance.startDiscount,
    };
