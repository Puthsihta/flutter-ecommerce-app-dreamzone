import 'package:dreamzone/data/models/provinces.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class RenderProvices extends StatelessWidget {
  final List<Provinces> provices;
  final int index;
  final Function onTap;

  const RenderProvices({
    super.key,
    required this.provices,
    required this.index,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: grayColor, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: whiteSmoke,
              backgroundImage: NetworkImage(provices[index].image_url!),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 100,
              child: Text(
                provices[index].name!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 2,
                softWrap: true,
                style: TextStyle(
                  fontSize: 16,
                  color: titleColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
