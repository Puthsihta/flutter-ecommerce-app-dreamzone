import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatelessWidget {
  static const routeName = "/profile/delete-accouont";
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("Delete Account"),
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
            const SizedBox(height: 10),
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
