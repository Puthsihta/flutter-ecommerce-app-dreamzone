import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/data/repos/setting_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/settings/setting-controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const routeName = "/profile/privacy";
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (context) =>
              SettingController(settingRepo: locator<SettingRepo>())
                ..getSetting("privacy_policy"),
          child: Consumer<SettingController>(
              builder: (context, viewController, child) {
            if (viewController.loading) {
              return const Center(child: CircularProgressIndicator());
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
