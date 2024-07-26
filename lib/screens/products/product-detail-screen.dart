import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/product_detail_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/products/product-detail-controller.dart';
import 'package:dreamzone/screens/products/product-screen.dart';
import 'package:dreamzone/screens/shop/shop-detail-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/render-product.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:dreamzone/widgets/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
                              Text(
                                currencyFormatter.format(double.parse(
                                    widget.argument.product.price!)),
                                style: TextStyle(
                                  color: baseColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
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
                                  onPressed: () {},
                                  icon: Icon(
                                    viewController.productDetail!.productDetail!
                                            .is_favorite!
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: baseColor,
                                  )),
                              Text(
                                "#d24332",
                                style: TextStyle(
                                  color: descriptionColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quantity",
                            style: TextStyle(
                              color: descriptionColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: descriptionColor,
                                  ),
                                  onPressed: () {},
                                ),
                                const SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 62, 44, 44),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon:
                                      Icon(Icons.add, color: descriptionColor),
                                  onPressed: () {},
                                )
                              ],
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
                                "Store Profile",
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
                                  "More",
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
                              "Related Products",
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
                                "More",
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
                      mainAxisExtent: 290),
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
