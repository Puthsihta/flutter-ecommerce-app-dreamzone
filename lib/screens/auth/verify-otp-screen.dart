import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/data/repos/auth_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/user_provider.dart';
import 'package:dreamzone/routes.dart';
import 'package:dreamzone/screens/auth/verify-otp-controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/spinning-loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();
    _focusNodes[0].requestFocus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showAlertDialog();
    });
    _controllers.last.addListener(checkLastController);
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void nextField(int index, String value) {
    if (value.isNotEmpty) {
      if (index < _focusNodes.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
  }

  void checkLastController() {
    if (_controllers.last.text.isNotEmpty) {
      verifyOtpController.verifyOtp(
          phone: widget.argument.phone, otp: getConcatenatedValue());
    }
  }

  String getConcatenatedValue() {
    return _controllers.map((controller) => controller.text).join();
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Code'),
          content: Text(widget.argument.code.toString()),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  final codeString = widget.argument.code
                      .toString()
                      .padLeft(4, '0'); // Ensures it is 4 digits
                  for (int i = 0; i < 4; i++) {
                    _controllers[i].text = codeString[i];
                  }
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
            print("verfiy code success");
            Navigator.of(context)
                .pushReplacementNamed(TabNavigationBar.routeName);
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
                          padding: paddingHorizontal,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(4, (index) {
                                  return SizedBox(
                                    width: 50,
                                    child: TextFormField(
                                      controller: _controllers[index],
                                      focusNode: _focusNodes[index],
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      maxLength: 1,
                                      decoration: const InputDecoration(
                                        counterText: "",
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (value) =>
                                          nextField(index, value),
                                    ),
                                  );
                                }),
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
