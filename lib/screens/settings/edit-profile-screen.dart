import 'dart:io';

import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:dreamzone/widgets/custom-text-input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
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
    // TODO: implement initState
    setState(() {
      phone.text = "+85592389497";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text("Edit Profile"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
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
                      CircleAvatar(
                          backgroundImage: (_image == null)
                              ? AssetImage('assets/images/logo.png')
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
                                        padding: EdgeInsets.all(15),
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
                          fillColor: Color(0xFFF5F6F9),
                          child: Icon(
                            Icons.camera_alt,
                            color: iconColor,
                            size: 20,
                          ),
                          padding: EdgeInsets.all(5),
                          shape: CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Puthsitha Mouern",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ))
              ],
            ),
          ),
          SizedBox(height: 20),
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
                  label: 'Phone',
                  hintText: 'Enter your phone number',
                  controller: phone,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: placeHolderColor,
                  ),
                  enable: false,
                  keyboardType: TextInputType.number,
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
                const SizedBox(height: 15),
                CustomTextInput(
                  label: 'Address',
                  hintText: 'Enter your address',
                  controller: address,
                  prefixIcon: Icon(
                    Icons.pin_drop,
                    color: placeHolderColor,
                  ),
                  enable: true,
                  keyboardType: TextInputType.streetAddress,
                ),
                const SizedBox(height: 50),
                CustomButton(
                  text: "Save",
                  onPressed: () {
                    // print("Name : ${name.text}");
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
