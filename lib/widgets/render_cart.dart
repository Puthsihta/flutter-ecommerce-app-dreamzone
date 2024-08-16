// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dreamzone/screens/check_out/order_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/models/cart.dart';
import 'package:dreamzone/providers/cart_provider.dart';
import 'package:dreamzone/screens/shop_detail/shop_detail_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/theme/theme.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/transparent_image.dart';

class RenderCartItem extends StatelessWidget {
  final ShopItem cart;
  final int index;
  final bool isShowBtnCheckout;

  const RenderCartItem({
    super.key,
    required this.cart,
    required this.index,
    required this.isShowBtnCheckout,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    // print("cart : ${cart.shop}");
    return Container(
      margin: EdgeInsets.fromLTRB(15, index == 0 ? 15 : 0, 15, 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ShopDetailScreen.routeName,
                    arguments: ShopDetailArgument(
                      shop: cart.shop!,
                    ),
                  );
                },
                child: Row(
                  children: [
                    cart.shop!.logo_image != null
                        ? CircleAvatar(
                            radius: 20,
                            backgroundColor: whiteSmoke,
                            backgroundImage:
                                NetworkImage(cart.shop!.logo_image!),
                          )
                        : CircleAvatar(
                            radius: 20,
                            backgroundColor: whiteSmoke,
                            backgroundImage:
                                const AssetImage('assets/images/logo.png'),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        cart.shop!.name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: titleColor,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: const Text("Delete Cart?"),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          CupertinoDialogAction(
                              onPressed: () {
                                Navigator.of(context).pop();
                                cartProvider.onRemoveShop(
                                    shopId: cart.shop!.id!);
                              },
                              child: const Text(
                                "Delete",
                                style: TextStyle(color: Colors.blue),
                              )),
                        ],
                        content: Text(
                            "Are you sure you wannt to delete shop ${cart.shop!.name!} from cart?"),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: deleteColor,
                ),
              )
            ],
          ),
          ...cart.product.values.map(
            (item) {
              // final discount = cart
              //     .product[cart.product[item.product.id.toString()]!.product.id
              //         .toString()]!
              //     .discount;
              print(
                  "cart.product[cart.product[item.product.id.toString()]!.product.id.toString()]!.discount : ${cart.product[cart.product[item.product.id.toString()]!.product.id.toString()]!.discount}");
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: cart
                                        .product[cart
                                            .product[
                                                item.product.id.toString()]!
                                            .product
                                            .id
                                            .toString()]!
                                        .product
                                        .image_url !=
                                    null
                                ? TransparentImage(
                                    url: cart
                                        .product[cart
                                            .product[
                                                item.product.id.toString()]!
                                            .product
                                            .id
                                            .toString()]!
                                        .product
                                        .image_url!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset("assets/images/logo.png"),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                cart
                                    .product[cart
                                        .product[item.product.id.toString()]!
                                        .product
                                        .id
                                        .toString()]!
                                    .product
                                    .name!,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            if (cart
                                    .product[cart
                                        .product[item.product.id.toString()]!
                                        .product
                                        .id
                                        .toString()]!
                                    .discount !=
                                0)
                              Row(
                                children: [
                                  Text(
                                    "Discout : ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: descriptionColor,
                                    ),
                                  ),
                                  Text(
                                    '${cart.product[cart.product[item.product.id.toString()]!.product.id.toString()]!.discount.toString()}%',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: discoutColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            Row(
                              children: [
                                if (cart
                                        .product[cart
                                            .product[
                                                item.product.id.toString()]!
                                            .product
                                            .id
                                            .toString()]!
                                        .discount !=
                                    0)
                                  Row(
                                    children: [
                                      Text(
                                        currencyFormatter.format(
                                          double.parse(
                                            cart
                                                .product[cart
                                                    .product[item.product.id
                                                        .toString()]!
                                                    .product
                                                    .id
                                                    .toString()]!
                                                .product
                                                .price!,
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: placeHolderColor,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                Text(
                                  currencyFormatter.format(double.parse(
                                        cart
                                            .product[cart
                                                .product[
                                                    item.product.id.toString()]!
                                                .product
                                                .id
                                                .toString()]!
                                            .product
                                            .price!,
                                      ) -
                                      (cart
                                                  .product[cart
                                                      .product[item.product.id
                                                          .toString()]!
                                                      .product
                                                      .id
                                                      .toString()]!
                                                  .discount /
                                              100) *
                                          double.parse(
                                            cart
                                                .product[cart
                                                    .product[item.product.id
                                                        .toString()]!
                                                    .product
                                                    .id
                                                    .toString()]!
                                                .product
                                                .price!,
                                          )),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: baseColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: cart
                                                      .product[cart
                                                          .product[item
                                                              .product.id
                                                              .toString()]!
                                                          .product
                                                          .id
                                                          .toString()]!
                                                      .quantity ==
                                                  1
                                              ? Icon(
                                                  Icons.delete_outline,
                                                  color: descriptionColor,
                                                )
                                              : Icon(
                                                  Icons.remove_circle_outline,
                                                  color: descriptionColor,
                                                ),
                                          onPressed: () {
                                            if (cart
                                                    .product[cart
                                                        .product[item.product.id
                                                            .toString()]!
                                                        .product
                                                        .id
                                                        .toString()]!
                                                    .quantity ==
                                                1) {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return CupertinoAlertDialog(
                                                    title: const Text(
                                                      "Delete Cart?",
                                                    ),
                                                    actions: [
                                                      CupertinoDialogAction(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                      CupertinoDialogAction(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          cartProvider
                                                              .onRemoveProduct(
                                                            shopId:
                                                                cart.shop!.id!,
                                                            productId: cart
                                                                .product[cart
                                                                    .product[item
                                                                        .product
                                                                        .id
                                                                        .toString()]!
                                                                    .product
                                                                    .id
                                                                    .toString()]!
                                                                .product
                                                                .id!,
                                                          );
                                                        },
                                                        child: const Text(
                                                          "Delete",
                                                          style: TextStyle(
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    content: Text(
                                                        "Are you sure you wannt to delete Product ${cart.product[cart.product[item.product.id.toString()]!.product.id.toString()]!.product.name!} from cart?"),
                                                  );
                                                },
                                              );
                                            } else {
                                              cartProvider.onDecrement(
                                                shopId: cart.shop!.id!,
                                                productId: cart
                                                    .product[cart
                                                        .product[item.product.id
                                                            .toString()]!
                                                        .product
                                                        .id
                                                        .toString()]!
                                                    .product
                                                    .id!,
                                              );
                                            }
                                          },
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: 50,
                                          child: Center(
                                            child: Text(
                                              cart
                                                  .product[cart
                                                      .product[item.product.id
                                                          .toString()]!
                                                      .product
                                                      .id
                                                      .toString()]!
                                                  .quantity
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add_circle_outline,
                                              color: descriptionColor),
                                          onPressed: () {
                                            cartProvider.onIncrement(
                                              shop: cart.shop!,
                                              product: cart
                                                  .product[cart
                                                      .product[item.product.id
                                                          .toString()]!
                                                      .product
                                                      .id
                                                      .toString()]!
                                                  .product,
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          if (isShowBtnCheckout)
            Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        OrderProductScreen.routeName,
                        arguments: OrderProductArgument(
                          cart: cart,
                        ),
                      );
                    },
                    child: Text(
                        "Checkout ${currencyFormatter.format(cartProvider.getTotal(shopId: cart.shop!.id!))}"),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
