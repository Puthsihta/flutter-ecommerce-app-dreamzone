import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/data/repos/login_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/auth/signin-controller.dart';
import 'package:dreamzone/screens/auth/verify-otp-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/validation.dart';
import 'package:dreamzone/widgets/custom-text-input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    // Request focus when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      refPhoneNumber.requestFocus();
    });
  }

  @override
  void dispose() {
    phoneNumber.dispose();
    refPhoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SinginController>(
      create: (context) => SinginController(
        loginRepo: locator<LoginRepo>(),
        onLoginError: (message) {
          showCupertinoDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => AlertDialog.adaptive(
              title: const Text("Login Fail"),
              content: Text(message.toString()),
            ),
          );
        },
        onLoginSuccess: (phone, code) {
          Navigator.of(context).pushNamed(
            VerifyOtpScreen.routeName,
            arguments: VerfiyOtpArgument(
              phone: phone,
              code: code!.code,
            ),
          );
        },
      ),
      child:
          Consumer<SinginController>(builder: (context, viewController, child) {
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
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: FilledButton(
                              onPressed: phoneNumber.text.isEmpty
                                  ? null
                                  : viewController.loading
                                      ? () {}
                                      : () {
                                          String result = phoneNumber.text;
                                          if (phoneNumber.text.isNotEmpty &&
                                              phoneNumber.text[0] == '0') {
                                            result =
                                                phoneNumber.text.substring(1);
                                          }
                                          viewController.login(
                                            phone: result,
                                          );
                                        },
                              child: viewController.loading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ))
                                  : Text(
                                      "Get Verification Code",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white),
                                    )),
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
      }),
    );
  }
}
