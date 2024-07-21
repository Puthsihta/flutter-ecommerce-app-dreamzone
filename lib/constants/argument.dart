import 'package:dreamzone/models/order.model.dart';
import 'package:dreamzone/models/products.model.dart';
import 'package:dreamzone/models/shop.model.dart';

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
