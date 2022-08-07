import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/widgets/custom_colors.dart';
import 'package:flutter_ui_collections/widgets/custom_text.dart';

List<String> countryCodes = [
  '+91',
  '+1',
];

class SendOtp extends StatefulWidget {
  final Function onSendOtpPressed;

  const SendOtp({Key? key, required this.onSendOtpPressed}) : super(key: key);

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  String countryCode = '+91';
  String mobile = '';

  void onCountryCodeChanged(countryCode) {
    this.countryCode = countryCode;
    setState(() {
      countryCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 8),
                child: const CustomText('Welcome to Flutter UI Collections!',
                    style: TextStyle(color: CustomColors.lightText))),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(top: 32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: CustomColors.primaryDark),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: CustomColors.primaryDark2,
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: DropdownButton(
                        value: countryCode,
                        style: const TextStyle(color: CustomColors.primary),
                        dropdownColor: CustomColors.primaryDark2,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        underline: const SizedBox(),
                        iconEnabledColor: CustomColors.primary,
                        items: countryCodes
                            .map((item) => DropdownMenuItem(
                                value: item, child: CustomText(item)))
                            .toList(),
                        onChanged: onCountryCodeChanged)),
                Expanded(
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => {mobile = value},
                  autofocus: true,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: CustomColors.primaryDark,
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Enter your Mobile',
                      hintStyle: TextStyle(color: Colors.white),
                      isDense: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  style: const TextStyle(color: Colors.white),
                ))
              ],
            )),
        Container(
            margin: const EdgeInsets.only(top: 64),
            child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () => widget.onSendOtpPressed(mobile),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ))),
                    child: const CustomText('Send OTP'))))
      ],
    );
  }
}
