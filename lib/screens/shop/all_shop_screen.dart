import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/all_shop_repo.dart';
import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/shop/all_shop_contoller.dart';
import 'package:dreamzone/screens/shop_detail/shop_detail_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/debounce.dart';
import 'package:dreamzone/widgets/fetch_error.dart';
import 'package:dreamzone/widgets/no_item.dart';
import 'package:dreamzone/widgets/render_shops.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllShopScreen extends StatefulWidget {
  static const routeName = "/shop/all";
  final AllShopArgument argument;
  const AllShopScreen({super.key, required this.argument});

  @override
  State<AllShopScreen> createState() => _AllShopScreenState();
}

class _AllShopScreenState extends State<AllShopScreen> {
  late AllShopScreenController shopViewController;
  final _scrollController = ScrollController();
  double boundaryOffset = 0.8;
  bool showSearchBar = false;
  final searchController = TextEditingController();

  final debouncer = Debouncer(milliseconds: 500);

  void scrollListener() {
    _scrollController.addListener(() {
      final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        shopViewController.onFetchNextPage();
      }
    });
  }

  void searchListener() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        shopViewController.onGetShop(
            search: "", provineId: widget.argument.provineId);
      } else {
        debouncer.run(() {
          shopViewController.onGetShop(
              search: searchController.text,
              provineId: widget.argument.provineId);
        });
      }
    });
  }

  @override
  void initState() {
    searchListener();
    scrollListener();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    searchController.dispose();
    _scrollController.dispose();
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(widget.argument.name ?? l10n!.all_shops),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 27,
            ),
            onPressed: () {
              setState(() {
                showSearchBar = true;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (showSearchBar || widget.argument.name == l10n!.all_shops)
            Container(
              color: baseColor,
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                controller: searchController,
                autofocus:
                    widget.argument.name == l10n!.all_shops || showSearchBar
                        ? true
                        : false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: baseColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: whiteSmoke,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (searchController.text.isEmpty) {
                        setState(() {
                          showSearchBar = false;
                        });
                      } else {
                        searchController.clear();
                      }
                    },
                    child: Visibility(
                      visible: true,
                      child: Icon(
                        Icons.cancel,
                        color: placeHolderColor,
                      ),
                    ),
                  ),
                  hintText: l10n.search_placeholder,
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) =>
                  AllShopScreenController(shopRepo: locator<AllShopRepo>())
                    ..onGetShop(provineId: widget.argument.provineId),
              child: Consumer<AllShopScreenController>(
                builder: (context, viewController, child) {
                  shopViewController = viewController;
                  if (viewController.loadingInitial) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (viewController.error != null) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: FetchError(
                        errorMessage: viewController.error.toString(),
                        onRetry: () => viewController.onGetShop(),
                      ),
                    );
                  }
                  if (viewController.shopsList.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const NoItem(),
                    );
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () =>
                              shopViewController.onGetShop(refresh: true),
                          child: CustomScrollView(
                            controller: _scrollController,
                            slivers: [
                              const SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 15,
                                ),
                              ),
                              SliverPadding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                                      return renderShop(context, index,
                                          viewController.shopsList);
                                    },
                                    childCount: viewController.shopsList.length,
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: viewController.loadingFetchNext
                                    ? const SizedBox(
                                        height: 100,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : !viewController.hasNextPage
                                        ? SizedBox(
                                            height: 100,
                                            child: Center(
                                              child: Text(l10n.no_more_data),
                                            ),
                                          )
                                        : const SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
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
