import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = "/profile/setting";
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text('Setting'),
      ),
      body: Column(
        children: [
          SettingListItem(
            title: 'Edit Profile',
            onTap: () {
              Navigator.pushNamed(context, '/profile/edit-profile');
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: descriptionColor,
            ),
          ),
          SettingListItem(
            title: 'Change Password',
            onTap: () {
              Navigator.pushNamed(context, '/setting/change-password');
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: descriptionColor,
            ),
          ),
          SettingListItem(
            title: 'Notifications',
            onTap: () {},
            trailing: Switch(
              activeColor: baseColor,
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingListItem extends StatelessWidget {
  final String title;
  final Function onTap;
  final dynamic trailing;
  const SettingListItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          trailing: trailing,
          title: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: 15,
            ),
          ),
          onTap: null,
        ),
      ),
    );
  }
}
