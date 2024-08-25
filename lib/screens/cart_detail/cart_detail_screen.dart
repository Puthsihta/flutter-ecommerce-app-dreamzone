import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/models/cart.dart';
import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/providers/cart_provider.dart';
import 'package:dreamzone/screens/check_out/order_product_screen.dart';
import 'package:dreamzone/screens/product_detail/product_detail_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/render_cart.dart';
import 'package:dreamzone/widgets/render_product_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartDetailScreen extends StatefulWidget {
  static const routeName = "/cart/detail";
  final CartDetialArgument argument;
  const CartDetailScreen({super.key, required this.argument});

  @override
  State<CartDetailScreen> createState() => _CartDetailScreenState();
}

class _CartDetailScreenState extends State<CartDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cartProvider = context.watch<CartProvider>();
    final carts = cartProvider.cart;
    final cartInShop = carts!.cart[widget.argument.shop!.id.toString()];
    final popularProduct = widget.argument.relateProducts;
    List<Product> filteredProducts = popularProduct!.where((product) {
      return !carts.cart[widget.argument.shop!.id.toString()]!.product
          .containsKey(product.id.toString());
    }).toList();
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(l10n!.cart_detail),
      ),
      body: Stack(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList.builder(
                  itemCount: [cartInShop].length,
                  itemBuilder: (context, index) {
                    return renderCartItem(
                      context,
                      index,
                      cartInShop!,
                    );
                  },
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (filteredProducts.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.only(
                            left: 12,
                            bottom: 15,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.hot_tub,
                                color: secondColor,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                l10n.popular_with_order,
                                style: TextStyle(
                                  color: titleColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: whiteSmoke,
                    height: 120, // Adjust the height as per your requirement
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return renderProduct(
                          context,
                          index,
                          filteredProducts,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(0, 255, 255, 255),
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    OrderProductScreen.routeName,
                    arguments: OrderProductArgument(
                      cart: cartInShop!,
                    ),
                  );
                },
                child: Text(
                    "${l10n.checkout} ${currencyFormatter.format(cartProvider.getTotal(shopId: widget.argument.shop!.id!))}"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget renderCartItem(BuildContext context, int index, ShopItem carts) {
    return RenderCartItem(
      cart: carts,
      index: index,
      isShowBtnCheckout: false,
    );
  }

  Widget renderProduct(BuildContext context, int index, products) {
    return RenderHorizontalProduct(
      products: products,
      index: index,
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: ProductDetailArgument(
            product: products[index],
          ),
        );
      },
      shop: widget.argument.shop!,
    );
  }
}
