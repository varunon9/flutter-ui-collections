import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/widgets/custom_text.dart';

void showSnackBar(BuildContext context, {required String message}) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: CustomText(message),
      action: SnackBarAction(
          label: 'X',
          textColor: Colors.white,
          onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
