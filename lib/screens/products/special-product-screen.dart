import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class SepecialProductScreen extends StatefulWidget {
  static const routeName = "/product/special";
  const SepecialProductScreen({super.key});

  @override
  State<SepecialProductScreen> createState() => _SepecialProductScreenState();
}

class _SepecialProductScreenState extends State<SepecialProductScreen> {
  final List<String> items = List.generate(100, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("Sepecial Products"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.fromLTRB(15, index == 0 ? 15 : 0, 15, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Background image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017650-best-shopping-in-japan-akihabara.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width / 1.07,
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
                                child: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg"),
                                  radius: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                width: 160,
                                child: Text(
                                  "Shop Name Placeholder",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 2,
                                  style: TextStyle(
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
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                              color: baseColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12)),
                            ),
                            child: const Text(
                              "10% OFF",
                              style: TextStyle(
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
  }
}
