import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/list-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatefulWidget {
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
        title: Text(
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
                    title: Text("Logout"),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      CupertinoDialogAction(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Logout",
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                    content: Text("Are you sure, you want to logout?"),
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
      icon: Icon(
        Icons.qr_code,
        size: 27,
      ),
      onPressed: () {
        showDialog(
          builder: (context) => AlertDialog(
            title: Text(
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
                          embeddedImage: AssetImage('assets/images/logo.png'),
                          embeddedImageStyle: QrEmbeddedImageStyle(
                            size: Size(30, 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
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
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: whiteSmoke,
                    backgroundImage: NetworkImage(
                        "https://dreamzone.phsartech.com/uploads/users/1684391005-logo.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        child: Flexible(
                          child: Text(
                            "Puthsitha Moeurn",
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18,
                                color: titleColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
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
