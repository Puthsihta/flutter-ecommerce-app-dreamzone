import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/promotion-shop-repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/promotion/promotion_shop_controller.dart';
import 'package:dreamzone/screens/shop_detail/shop_detail_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/fetch_error.dart';
import 'package:dreamzone/widgets/no_item.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PromotionShopScreen extends StatefulWidget {
  static const routeName = "/product/special";
  const PromotionShopScreen({super.key});

  @override
  State<PromotionShopScreen> createState() => _PromotionShopScreenState();
}

class _PromotionShopScreenState extends State<PromotionShopScreen> {
  late PromotionShopController _promotionShopController;
  final _scrollController = ScrollController();
  double boundaryOffset = 0.8;

  void scrollListener() {
    _scrollController.addListener(() {
      final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        _promotionShopController.onFetchNextPage();
      }
    });
  }

  @override
  void initState() {
    scrollListener();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("Promtions"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => PromotionShopController(
            promotionShopRepo: locator<PromotionShopRepo>())
          ..onGetPromotionShop(),
        child: Consumer<PromotionShopController>(
            builder: (context, viewController, child) {
          _promotionShopController = viewController;
          if (viewController.loadingInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (viewController.error != null) {
            return FetchError(
              errorMessage: viewController.error.toString(),
              onRetry: () => viewController.onGetPromotionShop(),
            );
          }
          if (viewController.promotionShopList.isEmpty) {
            return const NoItem();
          }
          return RefreshIndicator(
            onRefresh: () => viewController.onGetPromotionShop(refresh: true),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: viewController.promotionShopList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ShopDetailScreen.routeName,
                      arguments: ShopDetailArgument(
                        shop: viewController.promotionShopList[index].shop,
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        EdgeInsets.fromLTRB(15, index == 0 ? 15 : 0, 15, 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        // Background image
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: TransparentImage(
                                url: viewController
                                    .promotionShopList[index].shop.cover_image,
                              ),
                            )),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                              ),
                              color: Colors.black.withOpacity(0.4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: viewController
                                                  .promotionShopList[index]
                                                  .shop
                                                  .logo_image !=
                                              null
                                          ? CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                viewController
                                                    .promotionShopList[index]
                                                    .shop
                                                    .logo_image!,
                                              ),
                                              radius: 20,
                                            )
                                          : const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                "assets/images/logo.png",
                                              ),
                                              radius: 20,
                                            ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        viewController.promotionShopList[index]
                                            .shop.name!,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: baseColor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    viewController
                                        .promotionShopList[index].lable!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
