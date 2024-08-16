import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/validation.dart';
import 'package:dreamzone/widgets/custom_button.dart';
import 'package:dreamzone/widgets/customz_text_input.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = "/auth/reset-password";
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool obscureNewPass = true;
  bool obscureConfirmpass = true;

  late FocusNode refNewPass;
  late FocusNode refConfirmPass;

  String errorMessageNewPass = "";
  String errorMessageConfirPass = "";

  @override
  void initState() {
    super.initState();
    refNewPass = FocusNode();
    refConfirmPass = FocusNode();
  }

  @override
  void dispose() {
    refNewPass.dispose();
    refConfirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: whiteSmoke,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: paddingHorizontal * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text(
                "Create new password",
                style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                padding: paddingHorizontal,
                child: Column(
                  children: [
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
                        "Reset",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
