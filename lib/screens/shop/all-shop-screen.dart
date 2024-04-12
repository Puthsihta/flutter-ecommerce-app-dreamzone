import 'package:dreamzone/models/shop.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/render-shops.dart';
import 'package:flutter/material.dart';

class AllShopScreen extends StatefulWidget {
  const AllShopScreen({super.key});

  @override
  State<AllShopScreen> createState() => _AllShopScreenState();
}

class _AllShopScreenState extends State<AllShopScreen> {
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
  bool showSearchBar = false;
  TextEditingController searchCotroller = TextEditingController();
  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    searchCotroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? title = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
        backgroundColor: whiteSmoke,
        appBar: AppBar(
          backgroundColor: baseColor,
          title: Text(title ?? "All Shop"),
          actions: [
            IconButton(
              icon: Icon(
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
        body: CustomScrollView(
          slivers: [
            if (showSearchBar || title == "Search")
              SliverAppBar(
                backgroundColor: baseColor,
                automaticallyImplyLeading: false,
                expandedHeight: 70.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: TextField(
                      controller: searchCotroller,
                      autofocus:
                          title == "Search" || showSearchBar ? true : false,
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
                        contentPadding: EdgeInsets.all(10),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (searchCotroller.text.isEmpty) {
                              setState(() {
                                showSearchBar = false;
                              });
                            } else {
                              setState(() {
                                searchCotroller.text = ''; // Set the new text
                              });
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
                        hintText: 'Search...',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 120,
                  crossAxisSpacing: 15,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return renderShop(context, index);
                  },
                  childCount: shop.length,
                ),
              ),
            ),
          ],
        )
        // GridView.builder(
        //   padding: EdgeInsets.all(15),
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // crossAxisCount: 4,
        // mainAxisSpacing: 15,
        // mainAxisExtent: 120,
        // crossAxisSpacing: 15,
        //   ),
        //   itemCount: shop.length,
        //   itemBuilder: (context, index) {
        //     return renderShop(context, index);
        //   },
        // ),
        );
  }

  Widget renderShop(BuildContext context, int index) {
    return RenderShops(
      shop: shop,
      index: index,
      onTap: () {
        Navigator.pushNamed(context, '/shop/detail');
      },
    );
  }
}
