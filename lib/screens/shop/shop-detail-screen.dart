import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/shop_detail_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/products/product-detail-screen.dart';
import 'package:dreamzone/screens/products/product-screen.dart';
import 'package:dreamzone/screens/shop/shop-detail-controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/render-product.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:dreamzone/widgets/webview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopDetailScreen extends StatefulWidget {
  static const routeName = "/shop/detail";
  final ShopDetailArgument argument;
  const ShopDetailScreen({super.key, required this.argument});

  @override
  State<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      body: ChangeNotifierProvider(
        create: (context) =>
            ShopDetailController(shopDetialRepo: locator<ShopDetailRepo>())
              ..getShopDetail(widget.argument.shop.id!),
        child: Consumer<ShopDetailController>(
            builder: (context, viewController, child) {
          if (viewController.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height / 4,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: widget.argument.shop.cover_image != null
                      ? TransparentImage(
                          url: widget.argument.shop.cover_image!,
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
                    Container(
                      padding: const EdgeInsets.all(15),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              widget.argument.shop.logo_image != null
                                  ? CircleAvatar(
                                      radius: 30,
                                      backgroundColor: whiteSmoke,
                                      backgroundImage: NetworkImage(
                                        widget.argument.shop.logo_image!,
                                      ))
                                  : CircleAvatar(
                                      radius: 30,
                                      backgroundColor: whiteSmoke,
                                      backgroundImage: const AssetImage(
                                          'assets/images/logo.png'),
                                    ),
                              const SizedBox(width: 10),
                              Text(
                                widget.argument.shop.name!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: titleColor,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 200,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: greenColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.call_outlined,
                                        color: whiteSmoke,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Call Now",
                                        style: TextStyle(
                                          color: whiteSmoke,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 60,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: whiteSmoke,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child:
                                          const Icon(Icons.wordpress_outlined),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 60,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: whiteSmoke,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Icon(Icons.home_outlined),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About Store",
                                  style: TextStyle(
                                    color: titleColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (widget.argument.shop.description != null)
                                  HTMLView(
                                    htmlContent:
                                        widget.argument.shop.description!,
                                  ),
                              ],
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
                                width: 330,
                                child: Text(
                                  viewController
                                      .shopDetail!.shop!.address!.address!,
                                  style: TextStyle(
                                    color: descriptionColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "All Products",
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
                                  shopId: widget.argument.shop.id,
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
                      return renderProduct(
                          context, index, viewController.shopDetail!.products);
                    },
                    childCount: viewController.shopDetail!.products!.length,
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
