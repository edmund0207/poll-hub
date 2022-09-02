import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

class Options extends StatefulWidget {
  const Options({Key? key, required this.text, required this.pressed})
      : super(key: key);

  final String text;
  final bool pressed;
  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(
          top: 15.0, bottom: 15.0, right: 15.0, left: 20.0),
      decoration: BoxDecoration(
        border: widget.pressed
            ? Border.all(color: Colors.transparent)
            : Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(15),
        color: widget.pressed ? kPrimaryColor : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: widget.pressed ? Colors.white : Colors.black54,
              fontSize: 20,
            ),
          ),
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              border: Border.all(
                  color: widget.pressed ? Colors.transparent : Colors.black54),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              Icons.check_circle_rounded,
              color: widget.pressed ? Colors.white : Colors.transparent,
              size: 26,
            ),
          )
        ],
      ),
    );
  }
}
