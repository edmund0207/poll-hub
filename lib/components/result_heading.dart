import 'package:flutter/material.dart';

import '../constants.dart';

class ResultHeader extends StatefulWidget {
  const ResultHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<ResultHeader> createState() => _ResultHeaderState();
}

class _ResultHeaderState extends State<ResultHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(15),
      color: kPrimaryColor,
      width: double.infinity,
      child: Text(
        widget.text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
