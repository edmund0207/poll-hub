import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key, this.height, this.width, this.radius})
      : super(key: key);

  final double? height, width, radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.all(Radius.circular(radius!))),
    );
  }
}
