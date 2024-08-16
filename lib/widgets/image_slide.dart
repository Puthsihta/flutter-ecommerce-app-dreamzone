import 'package:carousel_slider/carousel_slider.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:dreamzone/data/models/home.dart';

class ImageSlide extends StatelessWidget {
  final List<Banner> banner;

  const ImageSlide({
    super.key,
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        // aspectRatio: 16 / 9,
        viewportFraction: 1,
        // initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.linearToEaseOut,
        // enlargeCenterPage: true,
        // enlargeFactor: 0.3,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
        // disableCenter: true,
        // pageSnapping: true,
      ),
      items: banner.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: TransparentImage(
                  url: item.image_url!,
                  enableCache: true,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
