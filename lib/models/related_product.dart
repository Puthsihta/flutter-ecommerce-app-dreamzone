import 'package:json_annotation/json_annotation.dart';

part 'related_product.g.dart';

@JsonSerializable()
class RelatedProduct {
  final int id;
  final String shopId;
  final String name;
  final num price;
  final int discount;
  final String discountType;
  final String? startDiscount;

  RelatedProduct(
      {required this.id,
      required this.shopId,
      required this.name,
      required this.price,
      required this.discount,
      required this.discountType,
      this.startDiscount});

  factory RelatedProduct.fromJson(Map<String, dynamic> json) =>
      _$RelatedProductFromJson(json);
  Map<String, dynamic> toJson() => _$RelatedProductToJson(this);
}
