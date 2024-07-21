import 'package:dreamzone/constants/discount_type.dart';
import 'package:dreamzone/data/models/cart.dart';
import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/providers/shop_provider.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  ShopProvider shopProvider;
  CartProvider({required this.shopProvider});

  void update(ShopProvider newShopProvider) {
    shopProvider = newShopProvider;
  }

  Map<int, Cart> _cart = {};
  Map<int, Cart> get cart => _cart;
  set cart(Map<int, Cart> newValue) {
    _cart = newValue;
    notifyListeners();
  }

  double get paymentAmount => getSubTotalPrice() - getTotalDiscount();
  Cart? get selectedCart => cart[shopProvider.shop?.id];

  void onIncrement({required Product product}) {
    print("Product : ${product.name_en} ${product.id}");
    if (selectedCart != null) {
      final item = selectedCart!.cart[product.id];

      if (item != null) {
        selectedCart!.cart.update(product.id,
            (value) => value.copyWith(quantity: value.quantity + 1));
      } else {
        selectedCart!.cart.addAll({
          product.id: CartItem(
              product: product,
              quantity: 1,
              discountType: DiscountType.NONE,
              discount: 0)
        });
      }
    } else {
      if (shopProvider.shop != null) {
        cart.addAll({
          shopProvider.shop!.id: Cart(cart: {
            product.id: CartItem(
                product: product,
                quantity: 1,
                discountType: DiscountType.NONE,
                discount: 0)
          })
        });
      }
    }

    notifyListeners();
  }

  void onDecrement({required int productId}) {
    if (selectedCart != null) {
      final item = selectedCart!.cart[productId];

      if (item != null && item.quantity > 1) {
        selectedCart!.cart.update(
            productId, (value) => value.copyWith(quantity: value.quantity - 1));
      } else {
        selectedCart!.cart.removeWhere((key, value) => key == productId);
      }
    }
    notifyListeners();
  }

  void onAddDiscount(
      {required int productId,
      required double discount,
      required String discountType}) {
    if (selectedCart != null) {
      final item = selectedCart!.cart[productId];

      if (item != null) {
        selectedCart!.cart.update(
            productId,
            (value) =>
                value.copyWith(discount: discount, discountType: discountType));
      }
    }
    notifyListeners();
  }

  void onRemoveDiscount({required int productId}) {
    if (selectedCart != null) {
      final item = selectedCart!.cart[productId];

      if (item != null) {
        selectedCart!.cart.update(
            productId,
            (value) =>
                value.copyWith(discount: 0, discountType: DiscountType.NONE));
      }
    }
    notifyListeners();
  }

  void onClearCart() {
    if (selectedCart != null) {
      selectedCart!.cart.clear();
      notifyListeners();
    }
  }

  double getSubTotalPrice() {
    if (selectedCart != null) {
      final total = selectedCart!.cart.values.fold<double>(
          0,
          (value, element) =>
              value + (element.product.price * element.quantity));
      return total;
    }
    return 0;
  }

  double getTotalDiscount() {
    if (selectedCart != null) {
      final total = selectedCart!.cart.values.fold<double>(
          0,
          (value, element) =>
              value +
              ((element.discountType == DiscountType.AMOUNT
                      ? element.discount
                      : element.discount / 100 * element.product.price) *
                  element.quantity));
      return total;
    }
    return 0;
  }
}
