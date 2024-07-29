import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/data/repos/setting_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/settings/contact-us-controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactUsScreen extends StatelessWidget {
  static const routeName = "/profile/contactus";
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("Contact Us"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ChangeNotifierProvider(
                    create: (context) =>
                        ContactusController(settingRepo: locator<SettingRepo>())
                          ..getContactUs(),
                    child: Consumer<ContactusController>(
                        builder: (context, viewController, child) {
                      print("viewController : ${viewController.contactUsData}");
                      if (viewController.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Container(
                        padding: paddingHorizontal * 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Support By ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: titleColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.phone,
                                  color: descriptionColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  viewController.contactUsData!.phone!,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: descriptionColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.mail,
                                  color: descriptionColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  viewController.contactUsData!.email!,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: descriptionColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.map_pin,
                                  color: descriptionColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: Text(
                                    viewController.contactUsData!.address!,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: descriptionColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Socail",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: titleColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.facebook,
                                    color: Colors.blueAccent,
                                    size: 40,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.play_circle,
                                    color: Colors.redAccent,
                                    size: 40,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.telegram,
                                    color: Colors.lightBlue,
                                    size: 40,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.public,
                                    color: Colors.lightBlueAccent,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
            // Text at the bottom of the screen
            const Text(
              '©️ Copyright Dreamzone',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
