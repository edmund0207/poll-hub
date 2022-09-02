import 'package:flutter/material.dart';

Container errorLoginMessage(Size size) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.all(15),
    width: size.width * 0.8,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      color: Colors.red,
    ),
    child: Row(
      children: const [
        Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
          size: 30,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          'Student ID/password is invalid',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
