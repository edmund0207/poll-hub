import 'package:flutter/material.dart';
import '../constants.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.hint,
    required this.icon,
    required this.onChange,
    required this.isNotVisible,
    this.suffixIcon,
    this.onPress,
    this.keyboardType,
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final IconData? suffixIcon;
  final bool isNotVisible;
  final ValueChanged<String> onChange;
  final Function()? onPress;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.only(top: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.0),
        color: kPrimaryLightColor,
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: isNotVisible,
        textAlignVertical: TextAlignVertical.center,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: onPress,
            child: Icon(
              suffixIcon,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
