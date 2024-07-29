import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/validation.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:dreamzone/widgets/custom-text-input.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = "/setting/change-password";
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool obscureCurrentPass = true;
  bool obscureNewPass = true;
  bool obscureConfirmpass = true;
  late FocusNode refCurrentPass;
  late FocusNode refNewPass;
  late FocusNode refConfirmPass;
  String errorMessageCurrPass = "";
  String errorMessageNewPass = "";
  String errorMessageConfirPass = "";

  @override
  void initState() {
    super.initState();
    refCurrentPass = FocusNode();
    refNewPass = FocusNode();
    refConfirmPass = FocusNode();
  }

  @override
  void dispose() {
    refCurrentPass.dispose();
    refNewPass.dispose();
    refConfirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteSmoke,
        appBar: AppBar(
          backgroundColor: baseColor,
          title: const Text("Change Password"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
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
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: paddingHorizontal,
                child: Column(
                  children: [
                    CustomTextInput(
                      label: 'Current Password',
                      hintText: 'Enter your current password',
                      controller: currentPassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: placeHolderColor,
                      ),
                      enable: true,
                      focusNode: refCurrentPass,
                      textInputAction: TextInputAction.next,
                      onSubmitAction: (value) {
                        refCurrentPass.unfocus();
                        FocusScope.of(context).requestFocus(refNewPass);
                      },
                      errorMessage: errorMessageCurrPass,
                      onChangedText: (value) {
                        setState(() {
                          errorMessageCurrPass = validateInputPassword(value);
                        });
                      },
                      obscureText: obscureCurrentPass,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          !obscureCurrentPass
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureCurrentPass = !obscureCurrentPass;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextInput(
                      label: 'New Password',
                      hintText: 'Enter your new password',
                      controller: newPassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: placeHolderColor,
                      ),
                      enable: true,
                      focusNode: refNewPass,
                      textInputAction: TextInputAction.next,
                      onSubmitAction: (value) {
                        refNewPass.unfocus();
                        FocusScope.of(context).requestFocus(refConfirmPass);
                      },
                      errorMessage: errorMessageNewPass,
                      onChangedText: (value) {
                        setState(() {
                          errorMessageNewPass = validateInputPassword(value);
                        });
                      },
                      obscureText: obscureNewPass,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          !obscureNewPass
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureNewPass = !obscureNewPass;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextInput(
                      label: 'Confirm Password',
                      hintText: 'Enter your confim password',
                      controller: confirmPassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: placeHolderColor,
                      ),
                      enable: true,
                      focusNode: refConfirmPass,
                      textInputAction: TextInputAction.done,
                      onSubmitAction: (value) {
                        refConfirmPass.unfocus();
                      },
                      errorMessage: errorMessageConfirPass,
                      onChangedText: (value) {
                        setState(() {
                          errorMessageConfirPass = validateInputPassword(value);
                        });
                      },
                      obscureText: obscureConfirmpass,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          !obscureConfirmpass
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureConfirmpass = !obscureConfirmpass;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      onPressed: () {},
                      child: const Text(
                        "Update",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
