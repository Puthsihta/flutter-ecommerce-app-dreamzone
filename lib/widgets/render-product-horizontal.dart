import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/data/models/shop.dart';
import 'package:dreamzone/providers/cart_provider.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/theme/theme.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RenderHorizontalProduct extends StatelessWidget {
  final List<Product> products;
  final int index;
  final Shop shop;
  final Function onTap;

  const RenderHorizontalProduct({
    super.key,
    required this.products,
    required this.index,
    required this.onTap,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.45,
        padding: const EdgeInsets.only(left: 8.0),
        margin: EdgeInsets.only(
          right: 12,
          left: index == 0 ? 12 : 0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: TransparentImage(
                  url: products[index].image_url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    color: Colors.white,
                    child: Text(
                      products[index].name!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (products[index].discount != 0)
                  Row(
                    children: [
                      Text(
                        "Discout : ",
                        style: TextStyle(
                          fontSize: 10,
                          color: descriptionColor,
                        ),
                      ),
                      Text(
                        '${products[index].discount.toString()}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: discoutColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                Row(
                  children: [
                    if (products[index].discount != 0)
                      Row(
                        children: [
                          Text(
                            currencyFormatter.format(
                              double.parse(
                                products[index].price!,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 12,
                              color: placeHolderColor,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                    Text(
                      currencyFormatter.format(double.parse(
                            products[index].price!,
                          ) -
                          (products[index].discount! / 100) *
                              double.parse(
                                products[index].price!,
                              )),
                      style: TextStyle(
                        fontSize: 12,
                        color: baseColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 25,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      cartProvider.onIncrement(
                        shop: shop,
                        product: products[index],
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 12,
                          color: iconColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 10,
                            color: titleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
