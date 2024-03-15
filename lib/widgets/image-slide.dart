import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlide extends StatelessWidget {
  final List<String> images;

  const ImageSlide({
    super.key,
    required this.images,
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
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        autoPlayCurve: Curves.linearToEaseOut,
        // enlargeCenterPage: true,
        // enlargeFactor: 0.3,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
        // disableCenter: true,
        // pageSnapping: true,
      ),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    i,
                    fit: BoxFit.cover,
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
