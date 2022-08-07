import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/widgets/custom_colors.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final int index;
  final int otpLength;

  const OtpInput(
      {Key? key,
      required this.controller,
      required this.index,
      required this.otpLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextFormField(
          autofocus: index == 0,
          maxLength: 1,
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              filled: true,
              fillColor: CustomColors.primaryDark,
              contentPadding: const EdgeInsets.all(12),
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              counterText: ''),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          style: const TextStyle(color: Colors.white)),
    );
  }
}
