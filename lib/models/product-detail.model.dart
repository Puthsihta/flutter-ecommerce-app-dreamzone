import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product-detail.model.g.dart';

@JsonSerializable()
class ProductDetail {
  final int id;
  final int? shop_id;
  final int? category_id;

  ProductDetail({
    required this.id,
    this.shop_id,
    this.category_id,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}
