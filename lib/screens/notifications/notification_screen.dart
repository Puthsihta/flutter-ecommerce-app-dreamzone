import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notification";
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(l10n!.notification),
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
              l10n.no_notification,
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
