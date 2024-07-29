import 'dart:io';

import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/data/models/requests/update-profile.dart';
import 'package:dreamzone/data/repos/user_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/user_provider.dart';
import 'package:dreamzone/screens/settings/edit-profile-controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:dreamzone/widgets/custom-text-input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "/profile/edit-profile";
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    name = TextEditingController(text: userProvider.user!.name);
    email = TextEditingController(text: userProvider.user!.email);
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("Edit Profile"),
      ),
      body: ChangeNotifierProvider<EditProfileController>(
        create: (context) => EditProfileController(
          userRepo: locator<UserRepo>(),
          userProvider: context.read<UserProvider>(),
          onEditProfileError: (message) => {
            showCupertinoDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) => AlertDialog.adaptive(
                title: const Text("Updated Fail"),
                content: Text(message.toString()),
              ),
            )
          },
          onEditProfileSuccess: () => {
            print("Edit Profile Success"),
            Navigator.pop(context),
          },
        ),
        child: Consumer2<UserProvider, EditProfileController>(builder: (
          context,
          user,
          editProfile,
          child,
        ) {
          return ListView(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          user.user!.image_url != null
                              ? CircleAvatar(
                                  backgroundImage: (_image == null)
                                      ? NetworkImage(
                                          user.user!.image_url!,
                                        )
                                      : FileImage(_image!) as ImageProvider)
                              : CircleAvatar(
                                  backgroundImage: (_image == null)
                                      ? const AssetImage(
                                          'assets/images/logo.png')
                                      : FileImage(_image!) as ImageProvider),
                          Positioned(
                            bottom: 0,
                            right: -25,
                            child: RawMaterialButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  enableDrag: true,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Wrap(
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.all(15),
                                            child: Text(
                                              "Select Options",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: titleColor),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Icon(
                                              Icons.camera_alt,
                                              color: iconColor,
                                            ),
                                            title: const Text('Camera'),
                                            onTap: () {
                                              // Handle delete action
                                              _takePhoto();
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(
                                              Icons.image,
                                              color: iconColor,
                                            ),
                                            title: const Text('Gallery'),
                                            onTap: () {
                                              // Handle edit action
                                              _getImageFromGallery();
                                              Navigator.pop(context);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              elevation: 2.0,
                              fillColor: const Color(0xFFF5F6F9),
                              padding: const EdgeInsets.all(5),
                              shape: const CircleBorder(),
                              child: Icon(
                                Icons.camera_alt,
                                color: iconColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.user!.name!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: paddingHorizontal,
                child: Column(
                  children: [
                    CustomTextInput(
                      label: 'Name',
                      hintText: 'Enter your name',
                      controller: name,
                      prefixIcon: Icon(
                        Icons.person,
                        color: placeHolderColor,
                      ),
                      enable: true,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 15),
                    CustomTextInput(
                      label: 'Email',
                      hintText: 'Enter your email',
                      controller: email,
                      prefixIcon: Icon(
                        Icons.email,
                        color: placeHolderColor,
                      ),
                      enable: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      onPressed: editProfile.loading
                          ? () {}
                          : () {
                              editProfile.updateProfile(
                                RequestUpdateProfile(
                                  name: name.text,
                                  email: email.text,
                                  image_url: user.user!.image_url,
                                ),
                              );
                              // print("Name : ${name.text}");
                            },
                      child: editProfile.loading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
