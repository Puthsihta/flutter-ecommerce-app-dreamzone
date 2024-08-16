import 'package:dreamzone/data/repos/setting_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/settings/setting_controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = "/profile/aboutus";
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("About Us"),
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
