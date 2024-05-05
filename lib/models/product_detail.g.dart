// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      product: json['product'] == null
          ? null
          : ProductDetail.fromJson(json['product'] as Map<String, dynamic>),
      relatedProduct: json['relatedProduct'] == null
          ? null
          : RelatedProduct.fromJson(
              json['relatedProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'product': instance.product,
      'relatedProduct': instance.relatedProduct,
    };
