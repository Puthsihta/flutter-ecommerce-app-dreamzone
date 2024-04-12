import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class LangeTitle extends StatefulWidget {
  final String langValue;
  final Function onChangeLanguage;
  const LangeTitle({
    super.key,
    required this.langValue,
    required this.onChangeLanguage,
  });

  @override
  State<LangeTitle> createState() => _LangeTitleState();
}

class _LangeTitleState extends State<LangeTitle> {
  bool is_selected = false;
  late String selectedValue = "English";

  @override
  void initState() {
    setState(() {
      selectedValue = widget.langValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Languages!',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            _listTile(
              language: 'English',
              image: 'assets/images/flags/uk.png',
              onTap: () {
                widget.onChangeLanguage("English");
                setState(() {
                  selectedValue = "English";
                });
              },
              selectedLanuage: selectedValue,
            ),
            _listTile(
              language: 'Khmer',
              image: 'assets/images/flags/km.png',
              onTap: () {
                widget.onChangeLanguage("Khmer");
                setState(() {
                  selectedValue = "Khmer";
                });
              },
              selectedLanuage: selectedValue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTile({
    required String language,
    required String image,
    Function()? onTap,
    required String selectedLanuage,
  }) {
    return ListTile(
        title: Text(
          language,
          style: TextStyle(
            fontSize: 15,
            color: titleColor,
          ),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 15,
        ),
        trailing: Icon(
          language == selectedLanuage
              ? Icons.radio_button_on
              : Icons.radio_button_off,
          color: iconColor,
          size: 25,
        ), // Arrow icon at the right
        onTap: onTap);
  }
}
