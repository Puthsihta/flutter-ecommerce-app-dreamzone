import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text("Contact Us"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.phone,
                              color: descriptionColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "+91 9876543210",
                              style: TextStyle(
                                fontSize: 15,
                                color: descriptionColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.mail,
                              color: descriptionColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "dreamzone@gmail.com",
                              style: TextStyle(
                                fontSize: 15,
                                color: descriptionColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.map_pin,
                              color: descriptionColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: Flexible(
                                child: Text(
                                  "#17K SongKat Jom Chao1 Khan Po SenChey ,Phnom Penh",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: descriptionColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.facebook,
                                color: Colors.blueAccent,
                                size: 40,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_circle,
                                color: Colors.redAccent,
                                size: 40,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.telegram,
                                color: Colors.lightBlue,
                                size: 40,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.public,
                                color: Colors.lightBlueAccent,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Text at the bottom of the screen
            Container(
              child: Text(
                '©️ Copyright Dreamzone',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
