import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LangeTitle extends StatelessWidget {
  const LangeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final l10n = context.l10n; // Assuming you have this extension
    final currentLocale = Localizations.localeOf(context);

    return AlertDialog(
      title: Text(
        l10n!.language,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            _listTile(
              language: l10n.english,
              image: 'assets/images/flags/uk.png',
              onTap: () {
                Navigator.of(context).pop();
                localeProvider.setLocale(const Locale('en'));
              },
              selectedLanuage: currentLocale.languageCode == 'en',
            ),
            _listTile(
              language: l10n.khmer,
              image: 'assets/images/flags/km.png',
              onTap: () {
                Navigator.of(context).pop();
                localeProvider.setLocale(const Locale('km'));
              },
              selectedLanuage: currentLocale.languageCode == 'km',
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
    required bool selectedLanuage,
  }) {
    return ListTile(
      title: Text(
        language,
        style: const TextStyle(
          fontSize: 15,
          // Set the title color or other properties as needed
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 15,
      ),
      trailing: Icon(
        selectedLanuage ? Icons.radio_button_on : Icons.radio_button_off,
        // Set the icon color or other properties as needed
        size: 25,
      ),
      onTap: onTap,
    );
  }
}
