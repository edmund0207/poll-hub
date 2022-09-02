import 'package:flutter/material.dart';
import '../../constants.dart';

Future<dynamic> voteClosedShowDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      elevation: 24,
      title: const Text(
        'VOTING CLOSED',
        style: kTitleTextStyle,
      ),
      content: const Icon(
        Icons.warning_amber_rounded,
        size: 100.0,
        color: Colors.red,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/resultScreen');
          },
          child: const Text(
            'OK',
            style: kNewsTextStyle,
          ),
        ),
      ],
    ),
  );
}
