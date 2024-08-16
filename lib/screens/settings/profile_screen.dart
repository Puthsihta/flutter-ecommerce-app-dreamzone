import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/user_provider.dart';
import 'package:dreamzone/routes.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text(
          'Profile',
        ),
        actions: [
          profileQRCode(context),
        ],
      ),
      body: ListView(
        children: [
          headerProfile(context),
          ListItem(
            title: 'Favorite',
            icon: Icons.favorite,
            onTap: () {
              Navigator.pushNamed(context, '/product/favorite');
            },
          ),
          ListItem(
            title: 'Settings',
            icon: Icons.settings,
            onTap: () {
              Navigator.pushNamed(context, '/profile/setting');
            },
          ),
          ListItem(
            title: 'Privacy & Policy',
            icon: Icons.expand_circle_down,
            onTap: () {
              Navigator.pushNamed(context, '/profile/privacy');
            },
          ),
          ListItem(
            title: 'About Us',
            icon: Icons.person_pin,
            onTap: () {
              Navigator.pushNamed(context, '/profile/aboutus');
            },
          ),
          ListItem(
            title: 'Contact Us',
            icon: Icons.contact_support,
            onTap: () {
              Navigator.pushNamed(context, '/profile/contactus');
            },
          ),
          // ListItem(
          //   title: 'Delete Accout',
          //   icon: Icons.person_remove,
          //   onTap: () {
          //     Navigator.pushNamed(context, '/profile/delete-accouont');
          //   },
          // ),
          ListItem(
            title: 'Logout',
            icon: Icons.logout,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: const Text("Logout"),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      CupertinoDialogAction(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.read<AuthProvider>().logout().then(
                                  (value) => {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      TabNavigationBar.routeName,
                                      (route) => false,
                                    )
                                  },
                                );
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                    content: const Text("Are you sure, you want to logout?"),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  IconButton profileQRCode(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.qr_code,
        size: 27,
      ),
      onPressed: () {
        showDialog(
          builder: (context) => AlertDialog(
            title: const Text(
              'This your profile QR!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 200.0, // Adjust width and height as needed
                    height: 200.0,
                    child: Stack(
                      children: [
                        QrImageView(
                          data: '1234567890',
                          version: QrVersions.auto,
                          size: 200.0,
                          embeddedImage:
                              const AssetImage('assets/images/logo.png'),
                          embeddedImageStyle: const QrEmbeddedImageStyle(
                            size: Size(30, 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'scan here share your referail code to your friends',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          context: context,
        );
      },
    );
  }

  Container headerProfile(context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Consumer<UserProvider>(builder: (context, user, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    user.user!.image_url != null
                        ? CircleAvatar(
                            radius: 30,
                            backgroundColor: whiteSmoke,
                            backgroundImage: NetworkImage(
                              user.user!.image_url!,
                            ),
                          )
                        : CircleAvatar(
                            radius: 30,
                            backgroundColor: whiteSmoke,
                            backgroundImage: const AssetImage(
                              'assets/images/logo.png',
                            ),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            user.user!.name!,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18,
                                color: titleColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile/edit-profile');
                    },
                    icon: Icon(
                      Icons.edit,
                      color: baseColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
