import 'package:dreamzone/models/product-detail.model.dart';
import 'package:dreamzone/models/related_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail.g.dart';

@JsonSerializable()
class ProductData {
  final ProductDetail? product;
  final RelatedProduct? relatedProduct;

  ProductData({this.product, this.relatedProduct});

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
