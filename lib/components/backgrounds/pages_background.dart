import 'package:flutter/material.dart';
import '../../constants.dart';

class PageBackground extends StatefulWidget {
  const PageBackground(
      {Key? key,
      this.icon,
      required this.child,
      this.onTap,
      required this.title,
      this.floatingActionButton})
      : super(key: key);

  final IconData? icon;
  final Widget child;
  final Function()? onTap;
  final Widget title;
  final Widget? floatingActionButton;

  @override
  State<PageBackground> createState() => _PageBackgroundState();
}

class _PageBackgroundState extends State<PageBackground> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        leading: GestureDetector(
          onTap: widget.onTap,
          child: Icon(
            widget.icon,
            color: kPrimaryColor,
            size: 30,
          ),
        ),
        title: widget.title,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 5),
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: widget.child,
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
