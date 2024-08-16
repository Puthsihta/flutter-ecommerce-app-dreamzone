import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/home_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/address_provider.dart';
import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/home_provider.dart';
import 'package:dreamzone/routes.dart';
import 'package:dreamzone/screens/home/home_controller.dart';
import 'package:dreamzone/screens/product_detail/product_detail_screen.dart';
import 'package:dreamzone/screens/products/product_screen.dart';
import 'package:dreamzone/screens/shop_detail/shop_detail_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/theme/theme.dart';
import 'package:dreamzone/widgets/fetch_error.dart';
import 'package:dreamzone/widgets/home_icon.dart';
import 'package:dreamzone/widgets/image_slide.dart';
import 'package:dreamzone/widgets/lang_title.dart';
import 'package:dreamzone/widgets/render_best_selling.dart';
import 'package:dreamzone/widgets/render_feature_shop.dart';
import 'package:dreamzone/widgets/render_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  var language = "Dart";
  late String selectedValue = "English";

  @override
  void dispose() {
    // print("dispose home ");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context, listen: true);
    return ChangeNotifierProvider(
        create: (context) => HomeScreenController(
              homeRepo: locator<HomeRepo>(),
              homeProvider: context.read<HomeProvider>(),
            )..getHomeData(),
        child: Scaffold(
          backgroundColor: whiteSmoke,
          appBar: appBar(addressProvider),
          body: Consumer<HomeScreenController>(
              builder: (context, viewController, child) {
            if (viewController.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (viewController.error != null) {
              return SizedBox(
                child: FetchError(
                  errorMessage: viewController.error.toString(),
                  onRetry: () => {viewController.getHomeData()},
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () => viewController.getHomeData(),
              child: CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ImageSlide(
                          banner: viewController.homeData!.banner,
                        ),
                        categories(),
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Best Selling",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        ProductScreen.routeName,
                                        arguments: ProductArgument(),
                                      );
                                    },
                                    child: const Text(
                                      "More",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ])),
                      ],
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 90,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return renderBestSelling(
                          context,
                          index,
                          viewController.homeData!.bestSalling,
                        );
                      },
                      childCount: viewController.homeData!.bestSalling.length,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: const Text(
                            "Feature Shops",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                viewController.homeData!.featuresShop.length,
                            itemBuilder: (context, index) {
                              return renderFeatureShop(context, index,
                                  viewController.homeData!.featuresShop);
                            },
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "All Products",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        ProductScreen.routeName,
                                        arguments: ProductArgument(),
                                      );
                                    },
                                    child: const Text(
                                      "More",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.green),
                                    ),
                                  ),
                                ])),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                    ),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              mainAxisExtent: 290),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return renderProduct(context, index,
                              viewController.homeData!.products);
                        },
                        childCount: viewController.homeData!.products.length,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
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

  Widget renderFeatureShop(BuildContext context, int index, shop) {
    return RenderFeatureShops(
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

  Widget renderBestSelling(BuildContext context, int index, products) {
    return RenderBestSelling(
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
    );
  }

  Container categories() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeIcon(
            image: 'assets/images/home/categories.png',
            title: "Categories",
            onTap: () {
              Navigator.pushNamed(context, '/categories');
            },
          ),
          HomeIcon(
            image: 'assets/images/home/shop.png',
            title: "Shops",
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                  TabNavigationBar.routeName,
                  arguments: 1);
            },
          ),
          HomeIcon(
            image: 'assets/images/home/offer.png',
            title: "Promotions",
            onTap: () {
              Navigator.pushNamed(context, '/product/special');
            },
          ),
          HomeIcon(
            image: 'assets/images/home/data.png',
            title: "Collections",
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductScreen.routeName,
                arguments: ProductArgument(
                  name: "Cellections",
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  AppBar appBar(AddressProvider addressProvider) {
    return AppBar(
      backgroundColor: baseColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/address');
            },
            child: Row(
              children: [
                Icon(
                  Icons.place,
                  color: iconColor,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    addressProvider.selectAddress.name!,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: descriptionColor,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        builder: (context) => LangeTitle(
                          langValue: selectedValue,
                          onChangeLanguage: (value) {
                            selectedValue = value;
                          },
                        ),
                        context: context,
                      );
                    },
                    child: Image.asset(
                      'assets/images/flags/uk.png',
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      ProductScreen.routeName,
                      arguments: ProductArgument(
                        name: "Search",
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {
                    final authProvider = context.read<AuthProvider>();
                    if (authProvider.isLoggedIn) {
                      Navigator.pushNamed(context, '/notification');
                    } else {
                      Navigator.pushNamed(context, '/auth/signin');
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
