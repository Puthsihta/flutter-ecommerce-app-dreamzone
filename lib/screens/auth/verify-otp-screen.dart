import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/screens/auth/signup-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/validation.dart';
import 'package:dreamzone/widgets/custom-text-input.dart';
import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();
  bool obscureOtpCode = true;
  late FocusNode refPhoneNumber;
  late FocusNode refOtpCode;
  String errorMessagePhone = "";
  String errorMessageotpCode = "";

  @override
  void initState() {
    super.initState();
    refPhoneNumber = FocusNode();
    refOtpCode = FocusNode();
  }

  @override
  void dispose() {
    refPhoneNumber.dispose();
    refOtpCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? lable = ModalRoute.of(context)?.settings.arguments as String?;
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
              SizedBox(
                height: 20,
              ),
              Text(
                lable!,
                style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
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
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // Handle onPressed event here
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          margin: marginAll / 2,
                          // color: Colors.red,
                          child: Text(
                            "Send OTP",
                            style: TextStyle(
                              color: baseColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      enable: true,
                      focusNode: refPhoneNumber,
                      textInputAction: TextInputAction.next,
                      onSubmitAction: (value) {
                        refPhoneNumber.unfocus();
                        FocusScope.of(context).requestFocus(refOtpCode);
                      },
                      errorMessage: errorMessagePhone,
                      onChangedText: (value) {
                        setState(() {
                          errorMessagePhone = validateInputPhone(value);
                        });
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20),
                    CustomTextInput(
                      label: 'OTP code',
                      hintText: 'Enter your otp code',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (lable == AuthType.forgetPassword) {
                            Navigator.pushNamed(
                              context,
                              '/auth/reset-password',
                              // arguments: "ForgetPassword",
                            );
                          } else if (lable == AuthType.retister) {
                            // Navigator.pushNamed(
                            //   context,
                            //   '/auth/signup',
                            //   arguments: "092389497",
                            // );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(
                                  phoneNumber: "092389497",
                                ),
                              ),
                            );
                          }
                          // Handle onPressed event here
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          decoration: BoxDecoration(
                            color: otpCode.text.length >= 6
                                ? baseColor
                                : placeHolderColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: 7,
                          ),
                          child: Text(
                            "Verify",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      controller: otpCode,
                      enable: true,
                      focusNode: refOtpCode,
                      textInputAction: TextInputAction.done,
                      onSubmitAction: (value) {
                        refOtpCode.unfocus();
                      },
                      errorMessage: errorMessageotpCode,
                      onChangedText: (value) {
                        setState(() {
                          // errorMessageotpCode = validateInputotpCode(value);
                        });
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
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
