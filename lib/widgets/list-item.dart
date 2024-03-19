import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const ListItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(5),
      child: ListTile(
        leading: Icon(
          icon,
          color: baseColor,
        ), // Icon at the left
        title: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: 15,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: placeHolderColor,
          size: 20,
        ), // Arrow icon at the right
        onTap: onTap(),
      ),
    );
  }
}
