import 'package:dreamzone/data/repos/setting_repo.dart';
import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/settings/setting_controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/fetch_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = "/profile/aboutus";
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(l10n!.about_us),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (context) =>
              SettingController(settingRepo: locator<SettingRepo>())
                ..getSetting("about_us"),
          child: Consumer<SettingController>(
              builder: (context, viewController, child) {
            if (viewController.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (viewController.error != null) {
              return SizedBox(
                child: FetchError(
                  errorMessage: viewController.error.toString(),
                  onRetry: () => {viewController.getSetting("about_us")},
                ),
              );
            }
            return Container(
              padding: marginAll,
              child: HtmlWidget(viewController.settingData!.content!),
            );
          }),
        ),
      ),
    );
  }
}
