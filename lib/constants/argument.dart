// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dreamzone/data/models/address.dart';
import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/data/models/shop.dart';
import 'package:dreamzone/models/order.model.dart';

class OrderDetailArgument {
  final Order order;
  OrderDetailArgument({
    required this.order,
  });
}

class ProductDetailArgument {
  final Product product;
  ProductDetailArgument({
    required this.product,
  });
}

class ShopDetailArgument {
  final Shop shop;
  ShopDetailArgument({
    required this.shop,
  });
}

class AllShopArgument {
  int? provineId;
  String? name;
  AllShopArgument({
    this.provineId,
    this.name,
  });
}

class ProductArgument {
  int? shopId;
  String? name;
  int? cateId;
  int? subCateId;
  ProductArgument({
    this.shopId,
    this.name,
    this.cateId,
    this.subCateId,
  });
}

class VerfiyOtpArgument {
  String phone;
  int? code;
  VerfiyOtpArgument({
    required this.phone,
    this.code,
  });
}

class AddressFromArgument {
  bool isCreat;
  Address? address;

  AddressFromArgument({
    required this.isCreat,
    this.address,
  });
}

class UpdateLocationArgument {
  Address? address;

  UpdateLocationArgument({
    this.address,
  });
}

class CartDetialArgument {
  Shop? shop;
  List<Product>? relateProducts;
  CartDetialArgument({
    this.shop,
    this.relateProducts,
  });
}
