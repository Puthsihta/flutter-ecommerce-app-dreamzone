import 'package:dreamzone/constants/storage_key.dart';
import 'package:dreamzone/data/models/cart.dart';
import 'package:dreamzone/data/models/product_detail.dart';
import 'package:dreamzone/data/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  CartProvider();
  final _preferences = SharedPreferences.getInstance();
  Cart? _cart = Cart(cart: {});
  Cart? get cart => _cart;
  set cart(Cart? newValue) {
    _cart = newValue;
    notifyListeners();
  }

  void onIncrement(
      {required Shop? shop, required ProductDetail? product}) async {
    Cart? selectedCart = cart;
    if (selectedCart != null) {
      final shops = selectedCart.cart[shop!.id.toString()];
      if (shops != null) {
        final products = shops.product[product!.id.toString()];
        if (products != null) {
          shops.product.update(product.id.toString(),
              (value) => value.copyWith(quantity: value.quantity + 1));
        } else {
          shops.product.addAll({
            product.id.toString(): ProductItem(
              product: product,
              quantity: 1,
              discount: product.discount!,
            )
          });
        }
      } else {
        selectedCart.cart.addAll({
          shop.id.toString(): ShopItem(
            shop: shop,
            product: {
              product!.id.toString(): ProductItem(
                product: product,
                quantity: 1,
                discount: product.discount!,
              )
            },
          ),
        });
      }
    } else {
      selectedCart?.cart.addAll({
        shop!.id.toString(): ShopItem(
          shop: shop,
          product: {
            product!.id.toString(): ProductItem(
              product: product,
              quantity: 1,
              discount: product.discount!,
            )
          },
        ),
      });
    }
    notifyListeners();
    final prefs = await _preferences;
    final cartString = cart!.toJsonString();
    if (cartString != '') {
      prefs.setString(StorageKeys.CART_KEY, cartString);
    }
  }

  void onDecrement({required int shopId, required int productId}) async {
    Cart? selectedCart = cart;
    if (selectedCart != null) {
      final shops = selectedCart.cart[shopId.toString()];
      final item = shops?.product[productId.toString()];

      if (item != null && item.quantity > 1) {
        shops?.product.update(productId.toString(),
            (value) => value.copyWith(quantity: value.quantity - 1));
      } else {
        shops?.product.removeWhere((key, value) => key == productId.toString());
      }
    }
    notifyListeners();
    final prefs = await _preferences;
    final cartString = cart!.toJsonString();
    if (cartString != '') {
      prefs.setString(StorageKeys.CART_KEY, cartString);
    }
  }

  void onRemoveProduct({required int shopId, required int productId}) async {
    Cart? selectedCart = cart;
    if (selectedCart != null) {
      final shops = selectedCart.cart[shopId.toString()];
      if (shops != null) {
        shops.product.removeWhere((key, value) => key == productId.toString());
        if (shops.product.isNotEmpty) {
          notifyListeners();
          final prefs = await _preferences;
          final cartString = cart!.toJsonString();
          if (cartString != '') {
            prefs.setString(StorageKeys.CART_KEY, cartString);
          }
        }
        if (shops.product.isEmpty) {
          onRemoveShop(shopId: shopId);
        }
      }
    }
  }

  void onRemoveShop({required int shopId}) async {
    Cart? selectedCart = cart;
    if (selectedCart != null) {
      selectedCart.cart.removeWhere((key, value) => key == shopId.toString());
      notifyListeners();
      final prefs = await _preferences;
      final cartString = cart!.toJsonString();
      if (cartString != '') {
        prefs.setString(StorageKeys.CART_KEY, cartString);
      }
    }
  }

  double getSubTotalPrice({required int shopId}) {
    Cart? selectedCart = cart;
    if (selectedCart != null) {
      final shops = selectedCart.cart[shopId.toString()];
      if (shops != null) {
        final total = shops.product.values.fold<double>(
            0,
            (value, element) =>
                value +
                (double.parse(element.product.price!) * element.quantity));
        return total;
      }
    }
    return 0;
  }

  double getTotalDiscount({required int shopId}) {
    Cart? selectedCart = cart;
    if (selectedCart != null) {
      final shops = selectedCart.cart[shopId.toString()];
      if (shops != null) {
        final total = shops.product.values.fold<double>(
            0,
            (value, element) =>
                value +
                ((element.discount /
                        100 *
                        double.parse(element.product.price!)) *
                    element.quantity));
        return total;
      }
    }
    return 0;
  }

  double getTotal({required int shopId}) {
    Cart? selectedCart = cart;
    if (selectedCart != null) {
      final total =
          getSubTotalPrice(shopId: shopId) - getTotalDiscount(shopId: shopId);
      return total;
    }
    return 0;
  }

  Future<void> clearCart() async {
    final prefs = await _preferences;
    prefs.remove(StorageKeys.CART_KEY);
  }

  Future<void> ensureInitialization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString(StorageKeys.CART_KEY);
    try {
      if (cartString != null) {
        final cartRespone = Cart.fromString(cartString);
        // print("\n\ncartRespone : $cartRespone\n\n");
        cart = cartRespone;
      }
    } catch (e) {
      print("\n\nerror get cartRespone: ${e}");
    }
  }
}
