import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text("Notification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.notifications,
              size: 80,
              color: descriptionColor,
            ),
            SizedBox(height: 10),
            Text(
              "Not Notifications",
              style: TextStyle(
                color: titleColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
