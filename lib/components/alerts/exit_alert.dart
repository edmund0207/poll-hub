import 'package:flutter/material.dart';
import '../../constants.dart';

Future<bool> onBackButtonPressed(BuildContext context) async {
  bool? exitApp = await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      elevation: 24,
      title: const Text(
        'Confirm Exit',
        style: kTitleTextStyle,
      ),
      content: const Text(
        'Are you sure you want to close the app?',
        style: TextStyle(color: Colors.black87),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text(
            'YES',
            style: kNewsTextStyle,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text(
            'CANCEL',
            style: kNewsTextStyle,
          ),
        ),
      ],
    ),
  );
  return exitApp ?? false;
}
