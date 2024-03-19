import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:dreamzone/widgets/list-item.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(
          'Profile',
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.qr_code,
              size: 27,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          headerProfile(),
          ListItem(
            title: 'Member',
            icon: Icons.people,
            onTap: () {},
          ),
          ListItem(
            title: 'Favorite',
            icon: Icons.favorite,
            onTap: () {},
          ),
          ListItem(
            title: 'Withdraw',
            icon: Icons.monetization_on,
            onTap: () {},
          ),
          ListItem(
            title: 'Transaction',
            icon: Icons.send_and_archive,
            onTap: () {},
          ),
          ListItem(
            title: 'Settings',
            icon: Icons.settings,
            onTap: () {},
          ),
          ListItem(
            title: 'Privacy & Policy',
            icon: Icons.expand_circle_down,
            onTap: () {},
          ),
          ListItem(
            title: 'Parnership Privacy',
            icon: Icons.card_membership,
            onTap: () {},
          ),
          ListItem(
            title: 'About Us',
            icon: Icons.person_pin,
            onTap: () {},
          ),
          ListItem(
            title: 'Contact Us',
            icon: Icons.contact_support,
            onTap: () {},
          ),
          ListItem(
            title: 'Delete Accout',
            icon: Icons.person_remove,
            onTap: () {},
          ),
          ListItem(
            title: 'Logout',
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Container headerProfile() {
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
                      Row(
                        children: [
                          Text(
                            "invative",
                            style: TextStyle(color: baseColor),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.cancel,
                            color: secondColor,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: baseColor,
                        size: 30,
                      )),
                  Container(
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: rejectedColor,
                    ),
                    child: Center(
                      child: Text(
                        "Active",
                        style: TextStyle(fontSize: 13, color: accInactive),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Divider(),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Personal PV",
                      style: TextStyle(fontSize: 15, color: titleColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "assets/images/coin.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          currencyFormatter.format(0),
                          style: TextStyle(
                              fontSize: 20,
                              color: baseColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                VerticalDivider(
                  indent: 30,
                  endIndent: 20,
                ),
                Column(
                  children: [
                    Text(
                      "Commission",
                      style: TextStyle(fontSize: 15, color: titleColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "assets/images/coin.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          currencyFormatter.format(0),
                          style: TextStyle(
                              fontSize: 20,
                              color: baseColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(children: [
            Text(
              "My Code: 92374304",
              style: TextStyle(fontSize: 14, color: titleColor),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.copy,
                color: baseColor,
                size: 20,
              ),
            )
          ])
        ],
      ),
    );
  }
}
