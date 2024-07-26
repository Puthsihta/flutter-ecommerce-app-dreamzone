import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/shop_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/models/provices.model.dart';
import 'package:dreamzone/models/shop.model.dart';
import 'package:dreamzone/providers/home_provider.dart';
import 'package:dreamzone/screens/shop/all-shop-screen.dart';
import 'package:dreamzone/screens/shop/shop-controller.dart';
import 'package:dreamzone/screens/shop/shop-detail-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/image-slide.dart';
import 'package:dreamzone/widgets/render-provices.dart';
import 'package:dreamzone/widgets/render-shops.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  static const routeName = "/shop";

  const ShopScreen({super.key});
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<Provices> provices = [
    Provices(
        name: "Phnom Penh",
        id: 1,
        url: "https://www.dreamzonekh.com/uploads/provinces/pp.jpeg"),
    Provices(
        name: "Kandal",
        id: 1,
        url: "https://www.dreamzonekh.com/uploads/provinces/kandal.jpeg"),
    Provices(
        name: "Kampong Thom",
        id: 1,
        url: "https://www.dreamzonekh.com/uploads/provinces/kpt.jpeg"),
    Provices(
        name: "Battambang",
        id: 1,
        url: "https://www.dreamzonekh.com/uploads/provinces/btb.jpeg"),
  ];

  final List<Shop> shop = [
    Shop(
        name: "Japan Store",
        id: 1,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017650-best-shopping-in-japan-akihabara.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg"),
    Shop(
        name: "FlOWER DREAM SHOP",
        id: 2,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg"),
    Shop(
        name: "OKA SOAP",
        id: 3,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg"),
    Shop(
        name: "Japan Store",
        id: 4,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017650-best-shopping-in-japan-akihabara.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg"),
    Shop(
        name: "FlOWER DREAM SHOP",
        id: 5,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg"),
    Shop(
        name: "OKA SOAP",
        id: 6,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg"),
    Shop(
        name: "Japan Store",
        id: 7,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017650-best-shopping-in-japan-akihabara.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg"),
    Shop(
        name: "FlOWER DREAM SHOP",
        id: 8,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg"),
    Shop(
        name: "OKA SOAP",
        id: 9,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text(
          'Shops',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 27,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AllShopScreen.routeName,
                arguments: AllShopArgument(name: "Search"),
              );
            },
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) =>
            ShopScreenController(shopRepo: locator<ShopRepo>())..getShop(),
        child: Consumer2<ShopScreenController, HomeProvider>(
            builder: (context, viewController, homeController, child) {
          if (viewController.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => viewController.getShop(),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ImageSlide(
                        banner: homeController.homeData!.banner,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: const Text(
                          "Provices",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(15),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            mainAxisExtent: 150,
                            crossAxisSpacing: 15),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return renderProvices(
                          context,
                          index,
                          viewController.shops!.provinces,
                        );
                      },
                      childCount: viewController.shops!.provinces.length,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      color: whiteSmoke,
                      height: 12,
                    ),
                    Container(
                        margin:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Shops",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AllShopScreen.routeName,
                                    arguments: AllShopArgument(),
                                  );
                                },
                                child: const Text(
                                  "More",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                ),
                              ),
                            ])),
                  ]),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(15),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 120,
                      crossAxisSpacing: 15,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return renderShop(
                            context, index, viewController.shops!.shops);
                      },
                      childCount: viewController.shops!.shops.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget renderProvices(BuildContext context, int index, provices) {
    return RenderProvices(
      provices: provices,
      index: index,
      onTap: () {
        Navigator.of(context).pushNamed(
          AllShopScreen.routeName,
          arguments: AllShopArgument(
              name: provices[index].name, provineId: provices[index].id),
        );
      },
    );
  }

  Widget renderShop(BuildContext context, int index, shop) {
    return RenderShops(
      shop: shop,
      index: index,
      onTap: () {
        Navigator.of(context).pushNamed(
          ShopDetailScreen.routeName,
          arguments: ShopDetailArgument(
            shop: shop[index],
          ),
        );
      },
    );
  }
}
