import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/home_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/home_provider.dart';
import 'package:dreamzone/routes.dart';
import 'package:dreamzone/screens/home/home-controller.dart';
import 'package:dreamzone/screens/products/product-detail-screen.dart';
import 'package:dreamzone/screens/products/product-screen.dart';
import 'package:dreamzone/screens/shop/shop-detail-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/home-icon.dart';
import 'package:dreamzone/widgets/image-slide.dart';
import 'package:dreamzone/widgets/lang-title.dart';
import 'package:dreamzone/widgets/render-best-selling.dart';
import 'package:dreamzone/widgets/render-feature-shop.dart';
import 'package:dreamzone/widgets/render-product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
    return ChangeNotifierProvider(
        create: (context) => HomeScreenController(
              homeRepo: locator<HomeRepo>(),
              homeProvider: context.read<HomeProvider>(),
            )..getHomeData(),
        child: Scaffold(
          backgroundColor: whiteSmoke,
          appBar: appBar(),
          body: Consumer<HomeScreenController>(
              builder: (context, viewController, child) {
            if (viewController.loading) {
              return const Center(child: CircularProgressIndicator());
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
            title: "Specials",
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

  AppBar appBar() {
    return AppBar(
      backgroundColor: baseColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "CHOC",
            style: TextStyle(
              color: titleColor,
              fontSize: 27,
            ),
          ),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
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
                  icon: const Icon(Icons.qr_code_2_outlined),
                  onPressed: () {
                    showDialog(
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'This is the App QR Code!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width:
                                    200.0, // Adjust width and height as needed
                                height: 200.0,
                                child: Stack(
                                  children: [
                                    QrImageView(
                                      data: '1234567890',
                                      version: QrVersions.auto,
                                      size: 200.0,
                                      embeddedImage: const AssetImage(
                                          'assets/images/logo.png'),
                                      embeddedImageStyle:
                                          const QrEmbeddedImageStyle(
                                        size: Size(30, 30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              const Text(
                                'scan here installing application',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      context: context,
                    );
                  },
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
                    // Navigator.pushNamed(context, '/notification');
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
