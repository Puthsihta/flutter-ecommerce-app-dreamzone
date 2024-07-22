import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/screens/auth/verify-otp-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/validation.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:dreamzone/widgets/custom-text-input.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "/auth/signin";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneNumber = TextEditingController();
  late FocusNode refPhoneNumber;
  String errorMessagePhone = "";

  @override
  void initState() {
    super.initState();
    refPhoneNumber = FocusNode();
  }

  @override
  void dispose() {
    refPhoneNumber.dispose();
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
                "Continue with phone number",
                style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Sms verification code required to continue",
                style: TextStyle(
                  color: descriptionColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
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
                      label: 'Phone Number',
                      hintText: 'Enter your phone number',
                      controller: phoneNumber,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: placeHolderColor,
                      ),
                      enable: true,
                      focusNode: refPhoneNumber,
                      textInputAction: TextInputAction.next,
                      errorMessage: errorMessagePhone,
                      onChangedText: (value) {
                        setState(() {
                          errorMessagePhone = validateInputPhone(value);
                        });
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    Container(
                      margin: marginAll,
                    ),
                    CustomButton(
                      text: "Get Verification Code",
                      onPressed: phoneNumber.text.isEmpty
                          ? null
                          : () {
                              if (phoneNumber.text.isNotEmpty &&
                                  phoneNumber.text[0] == '0') {
                                String result = phoneNumber.text.substring(1);
                                Navigator.of(context).pushNamed(
                                  VerifyOtpScreen.routeName,
                                  arguments: result,
                                );
                              } else {
                                Navigator.of(context).pushNamed(
                                  VerifyOtpScreen.routeName,
                                  arguments: phoneNumber.text,
                                );
                              }
                            },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account? ",
                          style: TextStyle(
                            color: titleColor,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login Later',
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
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
