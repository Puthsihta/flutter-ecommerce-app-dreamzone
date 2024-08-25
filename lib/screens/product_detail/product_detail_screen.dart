import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/models/product_detail.dart';
import 'package:dreamzone/data/models/shop.dart';
import 'package:dreamzone/data/repos/product_detail_repo.dart';
import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/cart_provider.dart';
import 'package:dreamzone/screens/auth/signin/signin_screen.dart';
import 'package:dreamzone/screens/cart_detail/cart_detail_screen.dart';
import 'package:dreamzone/screens/product_detail/product_detail_controller.dart';
import 'package:dreamzone/screens/products/product_screen.dart';
import 'package:dreamzone/screens/shop_detail/shop_detail_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/render_product.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:dreamzone/widgets/webview.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = "/product/detail";
  final ProductDetailArgument argument;
  const ProductDetailScreen({super.key, required this.argument});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cartProvider = context.watch<CartProvider>();
    final cart = cartProvider.cart;
    final theme = Theme.of(context);
    final discount = widget.argument.product.follow_shop_discount ??
        widget.argument.product.discount;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => ProductDetailController(
            productDetialRepo: locator<ProductDetialRepo>())
          ..getProductDetail(widget.argument.product.id!),
        child: Consumer<ProductDetailController>(
            builder: (context, viewController, child) {
          if (viewController.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          final cartItem = cart
              ?.cart[viewController.productDetail!.productDetail!.shop!.id
                  .toString()]
              ?.product[
                  viewController.productDetail!.productDetail!.id.toString()]
              ?.quantity;
          final products =
              cart?.cart[widget.argument.product.shop_id.toString()];
          final productInshop = products?.product.values
              .fold<int>(0, (value, element) => value + element.quantity);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.35,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: widget.argument.product.image_url != null
                      ? TransparentImage(
                          url: widget.argument.product.image_url!,
                          fit: BoxFit.cover,
                          enableCache: true,
                        )
                      : Image.asset("assets/images/logo.png"),
                ),
                actions: [
                  if (cartItem != null)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          CartDetailScreen.routeName,
                          arguments: CartDetialArgument(
                            shop: viewController
                                .productDetail!.productDetail!.shop,
                            relateProducts:
                                viewController.productDetail!.relateProducts,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Badge(
                          badgeContent: Text(
                            productInshop
                                .toString(), // The number to display in the badge
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: const Icon(Icons.add_shopping_cart),
                        ),
                      ),
                    ),
                ],
                // backgroundColor: baseColor,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Text(
                                  widget.argument.product.name!,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 3,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (discount != 0)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.discount,
                                        color: discoutColor,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "$discount% ${l10n!.off}",
                                        style: TextStyle(
                                          color: discoutColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Row(
                                children: [
                                  if (discount != 0)
                                    Row(
                                      children: [
                                        Text(
                                          currencyFormatter.format(double.parse(
                                              widget.argument.product.price!)),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: placeHolderColor,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                      ],
                                    ),
                                  Text(
                                    currencyFormatter.format(
                                      double.parse(
                                              widget.argument.product.price!) -
                                          ((discount! / 100) *
                                              double.parse(widget
                                                  .argument.product.price!)),
                                    ),
                                    style: TextStyle(
                                      color: baseColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )
                              // Text(
                              //   "Pv : 5pts",
                              //   style: TextStyle(
                              //     color: descriptionColor,
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 15,
                              //   ),
                              // ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: viewController.favLoading
                                    ? null
                                    : () {
                                        final authProvider =
                                            context.read<AuthProvider>();
                                        if (authProvider.isLoggedIn) {
                                          //action
                                          viewController.onFavoriteProduct(
                                            viewController.productDetail!
                                                .productDetail!.id!,
                                          );
                                        } else {
                                          // Navigate to login screen if not logged in
                                          Navigator.pushNamed(
                                              context, SignInScreen.routeName);
                                        }
                                      },
                                icon: viewController.favLoading
                                    ? const SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: CircularProgressIndicator(),
                                      )
                                    : Icon(
                                        viewController.productDetail!
                                                .productDetail!.is_favorite!
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: baseColor,
                                      ),
                              ),
                              // Text(
                              //   "#d24332",
                              //   style: TextStyle(
                              //     color: descriptionColor,
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 15,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          if (cartItem != null)
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    l10n!.qty_in_cart,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: descriptionColor,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: cartItem == 1
                                              ? Icon(
                                                  Icons.delete_outline,
                                                  color: secondColor,
                                                )
                                              : Icon(
                                                  Icons.remove_circle_outline,
                                                  color: descriptionColor,
                                                ),
                                          onPressed: () {
                                            Shop? shop = viewController
                                                .productDetail!
                                                .productDetail!
                                                .shop;
                                            ProductDetail? product =
                                                viewController.productDetail!
                                                    .productDetail;
                                            if (cartItem == 1) {
                                              cartProvider.onRemoveProduct(
                                                shopId: shop!.id!,
                                                productId: product!.id!,
                                              );
                                            } else {
                                              cartProvider.onDecrement(
                                                productId: product!.id!,
                                                shopId: shop!.id!,
                                              );
                                            }
                                          },
                                        ),
                                        SizedBox(
                                          height: 40,
                                          child: Center(
                                            child: Text(
                                              cartItem.toString(),
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 62, 44, 44),
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.add_circle_outline_rounded,
                                            color: descriptionColor,
                                          ),
                                          onPressed: () {
                                            Shop? shop = viewController
                                                .productDetail!
                                                .productDetail!
                                                .shop;
                                            cartProvider.onIncrement(
                                              shop: shop,
                                              product: widget.argument.product,
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (cartItem == null)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Shop? shop = viewController
                                      .productDetail!.productDetail!.shop;
                                  cartProvider.onIncrement(
                                    shop: shop,
                                    product: widget.argument.product,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart,
                                      size: 15,
                                      color: iconColor,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      l10n!.add_to_cart,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: titleColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (widget.argument.product.description != null)
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: HTMLView(
                          htmlContent: widget.argument.product.description!,
                        ),
                      ),
                    Container(
                      height: 15,
                      color: whiteSmoke,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n!.store_profile,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: titleColor,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                width: 250,
                                child: Text(
                                  viewController.productDetail!.productDetail!
                                      .shop!.name!,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: descriptionColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.map,
                                    color: inActiveColor,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: Text(
                                      viewController
                                          .productDetail!
                                          .productDetail!
                                          .shop!
                                          .address!
                                          .address!,
                                      style: TextStyle(
                                        color: descriptionColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (viewController.productDetail!.productDetail!
                                      .shop!.phone !=
                                  null)
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: inActiveColor,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      viewController.productDetail!
                                          .productDetail!.shop!.phone!,
                                      style: TextStyle(
                                        color: descriptionColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    whiteSmoke,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    ShopDetailScreen.routeName,
                                    arguments: ShopDetailArgument(
                                      shop: viewController
                                          .productDetail!.productDetail!.shop!,
                                    ),
                                  );
                                },
                                child: Text(
                                  l10n.more,
                                  style: TextStyle(
                                    color: greenColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: TransparentImage(
                                url: viewController.productDetail!
                                    .productDetail!.shop!.logo_image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 15,
                      color: whiteSmoke,
                    ),
                    if (viewController
                        .productDetail!.relateProducts!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              l10n.related_products,
                              style: TextStyle(
                                fontSize: 18,
                                color: titleColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  ProductScreen.routeName,
                                  arguments: ProductArgument(
                                    shopId: widget.argument.product.shop_id,
                                  ),
                                );
                              },
                              child: Text(
                                l10n.more,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: greenColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 290,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return renderProduct(context, index,
                          viewController.productDetail!.relateProducts);
                    },
                    childCount:
                        viewController.productDetail!.relateProducts!.length,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget renderProduct(BuildContext context, int index, products) {
    return RenderProduct(
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
      isFav: false,
    );
  }
}
