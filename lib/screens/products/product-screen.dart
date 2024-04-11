import 'package:dreamzone/models/products.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/render-product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Product> products = [
    Product(
        name: "MAGIC AMPOULE TONER PADS សំឡីជូតមុខ",
        id: 1,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684401424-1.webp",
        discount: 10,
        prices: 36),
    Product(
        name: "HYDRATING CLEANSING BALM ជួយសម្អាត Make Up",
        id: 2,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400972-1.webp",
        discount: 1,
        prices: 63),
    Product(
        name: "Peptide Ampoule Mist ទឹកបាញ់មុខ",
        id: 3,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400758-1.webp",
        discount: 15,
        prices: 99),
    Product(
        name: "Peptide Eye Cream គ្រីមលាបត្របកភ្នែក",
        id: 3,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400559-1.webp",
        discount: 3,
        prices: 99),
    Product(
        name: "MAGIC AMPOULE TONER PADS សំឡីជូតមុខ",
        id: 1,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684401424-1.webp",
        discount: 10,
        prices: 36),
    Product(
        name: "HYDRATING CLEANSING BALM ជួយសម្អាត Make Up",
        id: 2,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400972-1.webp",
        discount: 1,
        prices: 63),
    Product(
        name: "Peptide Ampoule Mist ទឹកបាញ់មុខ",
        id: 3,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400758-1.webp",
        discount: 15,
        prices: 99),
    Product(
        name: "Peptide Eye Cream គ្រីមលាបត្របកភ្នែក",
        id: 3,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400559-1.webp",
        discount: 3,
        prices: 99),
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
    final String? params =
        ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(params ?? 'Products'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_alt_outlined,
              size: 27,
            ),
            onPressed: () {
              showModalBottomSheet(
                enableDrag: true,
                useSafeArea: true,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Filter by Categories",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: titleColor),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.search),
                          title: Text('Collagen'),
                          onTap: () {
                            // Handle delete action
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.search),
                          title: Text('Brobiotic'),
                          onTap: () {
                            // Handle edit action
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.search),
                          title: Text('Vitamins'),
                          onTap: () {
                            // Handle share action
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
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
          if (showSearchBar || params == "Search")
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
                        params == "Search" || showSearchBar ? true : false,
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
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, mainAxisExtent: 290),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return renderProduct(context, index);
                },
                childCount: products.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderProduct(BuildContext context, int index) {
    return RenderProduct(
      products: products,
      index: index,
      onTap: () {
        Navigator.pushNamed(context, '/product/detail');
      },
    );
  }
}
