import 'package:flutter/material.dart';
import '../constants.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({Key? key, required this.text, this.onPress})
      : super(key: key);

  final String text;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.only(right: 50, bottom: 5),
        alignment: Alignment.bottomRight,
        child: Text(
          text,
          style: kOptionsTextStyle,
        ),
      ),
    );
  }
}
