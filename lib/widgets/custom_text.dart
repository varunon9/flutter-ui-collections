import 'package:flutter/material.dart';

enum CustomTextSize { large, medium, regular, small }

class CustomText extends StatelessWidget {
  final String text;
  final CustomTextSize size;
  final TextStyle? style;

  const CustomText(this.text,
      {this.size = CustomTextSize.regular, this.style, Key? key})
      : super(key: key);

  TextStyle getStyle() {
    switch (size) {
      case CustomTextSize.large:
        {
          return const TextStyle(fontSize: 24);
        }
      case CustomTextSize.medium:
        {
          return const TextStyle(fontSize: 20);
        }
      case CustomTextSize.regular:
        {
          return const TextStyle(fontSize: 16);
        }
      case CustomTextSize.small:
        {
          return const TextStyle(fontSize: 12);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: getStyle().merge(style));
  }
}
