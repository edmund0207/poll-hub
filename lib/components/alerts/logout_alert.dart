import 'package:flutter/material.dart';
import '../../constants.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 24,
      title: const Text(
        'Logout',
        style: kTitleTextStyle,
      ),
      content: const Text(
        'Are you sure you want to logout?',
        style: TextStyle(color: Colors.black87),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/loginScreen');
          },
          child: const Text(
            'YES',
            style: kNewsTextStyle,
          ),
        )
      ],
    );
  }
}
