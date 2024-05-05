import 'package:dreamzone/providers/home.provider.dart';
import 'package:dreamzone/screens/products/product-detail-screen.dart';
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
  final ScrollController scrollController;
  const HomeScreen({
    super.key,
    required this.scrollController,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var language = "Dart";
  late String selectedValue = "English";

  Future<void> onRefresh() async {
    // Simulate a time-consuming task
    await Future.delayed(Duration(seconds: 1));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).getHome();
    });
  }

  @override
  void initState() {
    print('HomeScreen HomeScreen');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).getHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: appBar(),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: onRefresh,
            child: CustomScrollView(
              controller: widget.scrollController,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ImageSlide(
                        images: value.slides,
                      ),
                      categories(),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Best Selling",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/product/all',
                                    );
                                  },
                                  child: Text(
                                    "More",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.green),
                                  ),
                                ),
                              ])),
                    ],
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 90,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return renderBestSelling(context, index, value);
                    },
                    childCount: value.bestSeller.length,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
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
                    Container(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.shop.length,
                          itemBuilder: (context, index) {
                            return renderFeatureShop(context, index, value);
                          }),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "All Products",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/product/all',
                                  );
                                },
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                ),
                              ),
                            ])),
                  ]),
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
                        return renderProduct(context, index, value);
                      },
                      childCount: value.product.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget renderProduct(BuildContext context, int index, HomeProvider value) {
    return RenderProduct(
      products: value.product,
      index: index,
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   '/product/detail',
        //   arguments: value.product[index].id,
        // );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              id: value.product[index].id ?? 1,
            ),
          ),
        );
      },
      isFav: false,
    );
  }

  Widget renderFeatureShop(
      BuildContext context, int index, HomeProvider value) {
    return RenderFeatureShops(
      shop: value.shop,
      index: index,
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   '/shop/detail',
        //   arguments: shop[index],
        // );
      },
    );
  }

  Widget renderBestSelling(
      BuildContext context, int index, HomeProvider value) {
    return RenderBestSelling(
      products: value.bestSeller,
      index: index,
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   '/product/detail',
        //   arguments: value.bestSeller[index],
        // );
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
              Navigator.pushNamed(
                context,
                '/',
                arguments: 1,
              );
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
              Navigator.pushNamed(
                context,
                '/product/all',
                arguments: 'Cellections',
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
          Image.asset(
            'assets/images/dreamzone.png',
            fit: BoxFit.contain,
            height: 32,
          ),
          Container(
            width: 200,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
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
                        title: Text(
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
                                      embeddedImage:
                                          AssetImage('assets/images/logo.png'),
                                      embeddedImageStyle: QrEmbeddedImageStyle(
                                        size: Size(30, 30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Text(
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
                    Navigator.pushNamed(
                      context,
                      '/product/all',
                      arguments: 'Search',
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/notification');
                    Navigator.pushNamed(context, '/auth/signin');
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
