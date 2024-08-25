import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/user_provider.dart';
import 'package:dreamzone/routes/routes.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(
          l10n!.profile,
        ),
      ),
      body: ListView(
        children: [
          headerProfile(context),
          ListItem(
            title: l10n.favorite,
            icon: Icons.favorite,
            onTap: () {
              Navigator.pushNamed(context, '/product/favorite');
            },
          ),
          ListItem(
            title: l10n.settings,
            icon: Icons.settings,
            onTap: () {
              Navigator.pushNamed(context, '/profile/setting');
            },
          ),
          ListItem(
            title: l10n.privacy_policy,
            icon: Icons.expand_circle_down,
            onTap: () {
              Navigator.pushNamed(context, '/profile/privacy');
            },
          ),
          ListItem(
            title: l10n.about_us,
            icon: Icons.person_pin,
            onTap: () {
              Navigator.pushNamed(context, '/profile/aboutus');
            },
          ),
          ListItem(
            title: l10n.contact_us,
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
            title: l10n.logout,
            icon: Icons.logout,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: Text(l10n.logout),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          l10n.cancel,
                          style: const TextStyle(color: Colors.red),
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
                          child: Text(
                            l10n.logout,
                            style: const TextStyle(color: Colors.blue),
                          )),
                    ],
                    content: Text(l10n.logout_alert),
                  );
                },
              );
            },
          ),
        ],
      ),
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
