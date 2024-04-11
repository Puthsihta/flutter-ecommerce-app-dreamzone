import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class LangeTitle extends StatefulWidget {
  final String language;
  final String selectedLanuage;
  final String image;
  final Function onTap;

  const LangeTitle({
    super.key,
    required this.language,
    required this.image,
    required this.onTap,
    required this.selectedLanuage,
  });

  @override
  State<LangeTitle> createState() => _LangeTitleState();
}

class _LangeTitleState extends State<LangeTitle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.language,
        style: TextStyle(
          fontSize: 15,
          color: titleColor,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.image),
        radius: 15,
      ),
      trailing: Icon(
        widget.selectedLanuage == widget.language
            ? Icons.radio_button_on
            : Icons.radio_button_off,
        color: iconColor,
        size: 25,
      ), // Arrow icon at the right
      onTap: () {
        widget.onTap();
      },
    );
  }
}
