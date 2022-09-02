import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    Key? key,
    required this.child,
    required this.topImage,
  }) : super(key: key);
  final Widget child;
  final String topImage;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'images/$topImage.png',
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'images/main_bottom.png',
              width: size.width * 0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
