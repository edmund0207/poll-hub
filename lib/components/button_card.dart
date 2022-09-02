import 'package:flutter/material.dart';

class ButtonCard extends StatefulWidget {
  const ButtonCard(
      {Key? key,
      required this.onPress,
      required this.text,
      required this.color,
      required this.style})
      : super(key: key);

  final Function() onPress;
  final String text;
  final Color color;
  final TextStyle style;

  @override
  State<ButtonCard> createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: ElevatedButton(
          onPressed: () async {
            setState(() => isLoading = false);
            await Future.delayed(const Duration(seconds: 2), widget.onPress);
            setState(() => isLoading = true);
          },
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            primary: widget.color,
            padding: const EdgeInsets.all(20),
            shape: const StadiumBorder(),
            minimumSize: const Size.fromHeight(55),
          ),
          child: isLoading
              ? FittedBox(
                  child: Text(
                    widget.text,
                    style: widget.style,
                    textAlign: TextAlign.center,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Please wait...',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
        )
        // :
        );
  }
}
