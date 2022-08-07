import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/constants.dart';
import 'package:flutter_ui_collections/modules/login/widgets/otp_input.dart';
import 'package:flutter_ui_collections/widgets/custom_colors.dart';
import 'package:flutter_ui_collections/widgets/custom_text.dart';

class VerifyOtp extends StatefulWidget {
  final Function onVerifyOtpPressed;
  final Function onResendOtpPressed;
  final Function onChangeNumberPressed;
  final String mobile;

  const VerifyOtp(
      {Key? key,
      required this.onVerifyOtpPressed,
      required this.onResendOtpPressed,
      required this.onChangeNumberPressed,
      required this.mobile})
      : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String otp = '';

  final TextEditingController otpInput1 = TextEditingController();
  final TextEditingController otpInput2 = TextEditingController();
  final TextEditingController otpInput3 = TextEditingController();
  final TextEditingController otpInput4 = TextEditingController();
  final TextEditingController otpInput5 = TextEditingController();
  final TextEditingController otpInput6 = TextEditingController();

  void onOtpChanged(countryCode) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 8),
                child: CustomText('Enter the OTP sent to ${widget.mobile}',
                    style: const TextStyle(color: CustomColors.lightText))),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpInput(
                    controller: otpInput1,
                    index: 0,
                    otpLength: Constants.otpLength),
                OtpInput(
                    controller: otpInput2,
                    index: 1,
                    otpLength: Constants.otpLength),
                OtpInput(
                    controller: otpInput3,
                    index: 2,
                    otpLength: Constants.otpLength),
                OtpInput(
                    controller: otpInput4,
                    index: 3,
                    otpLength: Constants.otpLength),
                OtpInput(
                    controller: otpInput5,
                    index: 4,
                    otpLength: Constants.otpLength),
                OtpInput(
                    controller: otpInput6,
                    index: 5,
                    otpLength: Constants.otpLength)
              ],
            )),
        Container(
            margin: const EdgeInsets.only(top: 64),
            child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      String otp = otpInput1.text +
                          otpInput2.text +
                          otpInput3.text +
                          otpInput4.text +
                          otpInput5.text +
                          otpInput6.text;
                      widget.onVerifyOtpPressed(otp, context);
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ))),
                    child: const CustomText('Verify OTP')))),
        Container(
            margin: const EdgeInsets.only(top: 12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomText(
                "Didn't receive OTP?",
                size: CustomTextSize.small,
                style: TextStyle(color: Colors.white),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 12),
                  alignment: Alignment.centerLeft,
                  child: Row(children: [
                    Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: InkWell(
                          child: const CustomText('Resend',
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline)),
                          onTap: () => widget.onResendOtpPressed(),
                        )),
                    Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: const CustomText('|',
                            style: TextStyle(color: Colors.white))),
                    GestureDetector(
                        child: const CustomText('Change number',
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline)),
                        onTap: () => widget.onChangeNumberPressed())
                  ]))
            ]))
      ],
    );
  }
}
