import 'package:dreamzone/models/provices.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class RenderProvices extends StatelessWidget {
  final List<Provices> provices;
  final int index;

  const RenderProvices(
      {super.key, required this.provices, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: grayColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: whiteSmoke,
            backgroundImage: NetworkImage(provices[index].url),
          ),
          SizedBox(height: 10),
          Container(
            width: 100,
            child: Flexible(
              child: Text(
                provices[index].name,
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
          ),
        ],
      ),
    );
  }
}
