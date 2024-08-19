import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/data/repos/auth_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/user_provider.dart';
import 'package:dreamzone/routes/routes.dart';
import 'package:dreamzone/screens/auth/verify/verify_otp_controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/spinning_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  static const routeName = "/auth/verify-otp";

  final VerfiyOtpArgument argument;
  const VerifyOtpScreen({
    super.key,
    required this.argument,
  });

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late VerifyOtpController verifyOtpController;
  final TextEditingController _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showAlertDialog();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pinController.dispose();
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Code'),
          content: Text(widget.argument.code.toString()),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _pinController.text = widget.argument.code.toString();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: whiteSmoke,
      ),
      body: ChangeNotifierProvider<VerifyOtpController>(
        create: (context) => VerifyOtpController(
          authProvider: context.read<AuthProvider>(),
          authRepo: locator<AuthRepo>(),
          userProvider: context.read<UserProvider>(),
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
          onLoginSuccess: () {
            // print("verfiy code success");
            Navigator.of(context).pushNamedAndRemoveUntil(
              TabNavigationBar.routeName,
              (route) => false,
            );
          },
        ),
        child: Consumer<VerifyOtpController>(
          builder: (context, viewContoller, child) {
            verifyOtpController = viewContoller;
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: paddingHorizontal * 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'OTP sent successfully',
                          style: TextStyle(
                            color: titleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Enter 4 digits code sent to you at +${widget.argument.phone}',
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
                          height: 200,
                          padding: paddingHorizontal,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              PinCodeTextField(
                                controller: _pinController,
                                appContext: context,
                                length: 4,
                                onChanged: (value) {},
                                autoFocus: true,
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  activeFillColor: Colors.white,
                                  activeColor: baseColor,
                                  inactiveColor: descriptionColor,
                                  selectedColor: baseColor,
                                ),
                                onCompleted: (value) {
                                  if (value.isNotEmpty) {
                                    verifyOtpController.verifyOtp(
                                      phone: widget.argument.phone,
                                      otp: value,
                                    );
                                  }
                                },
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
                Container(
                  child: viewContoller.loading
                      ? const SpinningLoading()
                      : Container(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
