import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/validation.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:dreamzone/widgets/custom-text-input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscurePassword = true;
  late FocusNode refPhoneNumber;
  late FocusNode refPassword;
  String errorMessagePhone = "";
  String errorMessagePassword = "";

  @override
  void initState() {
    super.initState();
    refPhoneNumber = FocusNode();
    refPassword = FocusNode();
  }

  @override
  void dispose() {
    refPhoneNumber.dispose();
    refPassword.dispose();
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Login",
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
                      enable: true,
                      focusNode: refPhoneNumber,
                      textInputAction: TextInputAction.next,
                      onSubmitAction: (value) {
                        if (errorMessagePhone == "") {
                          refPhoneNumber.unfocus();
                          FocusScope.of(context).requestFocus(refPassword);
                        } else {
                          FocusScope.of(context).requestFocus(refPhoneNumber);
                        }
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
                      label: 'Password',
                      hintText: 'Enter your password',
                      controller: password,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: placeHolderColor,
                      ),
                      enable: true,
                      focusNode: refPassword,
                      textInputAction: TextInputAction.done,
                      onSubmitAction: (value) {
                        if (errorMessagePassword == "") {
                          refPassword.unfocus();
                        } else {
                          FocusScope.of(context).requestFocus(refPassword);
                        }
                      },
                      errorMessage: errorMessagePassword,
                      onChangedText: (value) {
                        setState(() {
                          errorMessagePassword = validateInputPassword(value);
                        });
                      },
                      obscureText: obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          !obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: marginAll,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/auth/verify-otp',
                                arguments: AuthType.forgetPassword,
                              );
                            },
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(
                                color: secondColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: "Login",
                      onPressed:
                          (phoneNumber.text.isEmpty || password.text.isEmpty)
                              ? null
                              : () {},
                    ),
                    SizedBox(
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
                            Navigator.pushNamed(
                              context,
                              '/auth/verify-otp',
                              arguments: AuthType.retister,
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
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
