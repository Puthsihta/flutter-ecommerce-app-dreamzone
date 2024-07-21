import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/validation.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:dreamzone/widgets/custom-text-input.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/auth/signup";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool obscurePass = true;
  bool obscureConfirmpass = true;
  bool acceptCondition = false;

  late FocusNode refPass;
  late FocusNode refConfirmPass;

  String errorMessagPass = "";
  String errorMessageConfirPass = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      phone.text = "092389497";
    });
    refPass = FocusNode();
    refConfirmPass = FocusNode();
  }

  @override
  void dispose() {
    refPass.dispose();
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Register",
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
                      controller: phone,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: placeHolderColor,
                      ),
                      enable: false,
                      textInputAction: TextInputAction.next,
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
                      focusNode: refPass,
                      textInputAction: TextInputAction.done,
                      onSubmitAction: (value) {
                        refPass.unfocus();
                        FocusScope.of(context).requestFocus(refConfirmPass);
                      },
                      errorMessage: errorMessagPass,
                      onChangedText: (value) {
                        setState(() {
                          errorMessagPass = validateInputPassword(value);
                        });
                      },
                      obscureText: obscurePass,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          !obscurePass
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePass = !obscurePass;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                acceptCondition = !acceptCondition;
                              });
                            },
                            icon: Icon(
                              acceptCondition
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: baseColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/profile/privacy',
                              );
                            },
                            child: Text(
                              "Terms of Service",
                              style: TextStyle(
                                  color: titleColor,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: "Register",
                      onPressed: acceptCondition ? () {} : null,
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
