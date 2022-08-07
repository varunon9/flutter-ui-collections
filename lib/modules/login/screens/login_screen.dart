import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/constants.dart';
import 'package:flutter_ui_collections/modules/login/widgets/send_otp.dart';
import 'package:flutter_ui_collections/modules/login/widgets/verify_otp.dart';
import 'package:flutter_ui_collections/utils/common.dart';
import 'package:flutter_ui_collections/widgets/heading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool otpSent = false;
  String mobile = '';

  void onSendOtpPressed(String mobile) {
    this.mobile = mobile;
    otpSent = true;
    setState(() {
      otpSent;
    });
  }

  void onVerifyOtpPressed(String otp, BuildContext context) {
    if (otp.length != Constants.otpLength) {
      showSnackBar(context, message: 'Please enter valid OTP');
    } else {
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  void onResendOtpPressed() {}

  void onChangeNumberPressed() {
    otpSent = false;
    setState(() {
      otpSent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_background.png'),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Heading(
                  'Hello!',
                  type: HeadingType.h1,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            otpSent
                ? VerifyOtp(
                    mobile: mobile,
                    onVerifyOtpPressed: onVerifyOtpPressed,
                    onResendOtpPressed: onResendOtpPressed,
                    onChangeNumberPressed: onChangeNumberPressed,
                  )
                : SendOtp(onSendOtpPressed: onSendOtpPressed)
          ],
        ),
      ),
    );
  }
}
