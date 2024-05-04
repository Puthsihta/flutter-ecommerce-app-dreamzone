import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  final String image;
  final String title;
  final Function onTap;

  const HomeIcon({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            onTap();
          },
          child: Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(title)
      ],
    );
  }
}
