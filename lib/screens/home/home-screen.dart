import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/home-icon.dart';
import 'package:dreamzone/widgets/image-slide.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _images = [
    'https://dreamzone.phsartech.com/uploads/slide/1682340854-telegram-cloud-document-5-6210643450136628041.png',
    'https://dreamzone.phsartech.com/uploads/slide/1682340976-telegram-cloud-document-5-6210643450136628042.png',
    'https://dreamzone.phsartech.com/uploads/slide/1682341280-tg_image_229619768.png',
  ];

  // List icon = [

  // ]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: appBar(),
      body: Column(
        children: [
          ImageSlide(
            images: _images,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeIcon(
                  image: 'assets/images/home/categories.png',
                  title: "Categories",
                ),
                HomeIcon(
                  image: 'assets/images/home/shop.png',
                  title: "Shops",
                ),
                HomeIcon(
                  image: 'assets/images/home/offer.png',
                  title: "Specials",
                ),
                HomeIcon(
                  image: 'assets/images/home/data.png',
                  title: "Collections",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(255, 193, 7, 1),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/dreamzone.png',
            fit: BoxFit.contain,
            height: 32,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/flags/uk.png',
                fit: BoxFit.cover,
                height: 25,
              ),
              IconButton(
                icon: const Icon(Icons.qr_code_2_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
