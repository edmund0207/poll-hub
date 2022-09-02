import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

enum ButtonState { init, loading, done }

class SubmitButton extends StatefulWidget {
  const SubmitButton({Key? key, required this.onPressed}) : super(key: key);
  final Function() onPressed;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  ButtonState state = ButtonState.init;
  bool isAnimating = true;

  late bool isComplete;
  @override
  void initState() {
    isComplete = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isStretched = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.done;
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        child: AnimatedContainer(
          height: 50,
          width: state == ButtonState.init ? size.width * 0.7 : 50,
          duration: const Duration(milliseconds: 300),
          onEnd: () => setState(() => isAnimating = !isAnimating),
          curve: Curves.easeIn,
          child: isStretched ? buildButton(size) : buildSmallButton(isDone),
        ),
      ),
    );
  }

  SizedBox buildButton(Size size) {
    bool hasConnection = false;
    return SizedBox(
      child: OutlinedButton(
        onPressed: () async {
          hasConnection = await InternetConnectionChecker().hasConnection;
          hasConnection ? getState() : buildShowSimpleNotification();
        },
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          side: const BorderSide(color: kPrimaryColor, width: 2),
        ),
        child: FittedBox(
          child: Text(
            isComplete ? 'Submitted' : 'Submit',
            style: kSubmitButtonTextStyle,
          ),
        ),
      ),
    );
  }

  OverlaySupportEntry buildShowSimpleNotification() {
    return showSimpleNotification(
      const Center(
        child: Text(
          'No Internet Connection Established',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      background: Colors.red,
    );
  }

  Container buildSmallButton(bool isDone) {
    Color color = isDone ? Colors.green : kPrimaryColor;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: isDone
            ? const Icon(
                Icons.done,
                color: Colors.white,
                size: 40,
              )
            : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }

  Future<void> getState() async {
    setState(() => state = ButtonState.loading);
    await Future.delayed(const Duration(seconds: 3));
    setState(() => state = ButtonState.done);
    await Future.delayed(const Duration(seconds: 1), widget.onPressed);
    setState(() => state = ButtonState.init);
    setState(() => isComplete = true);
  }
}
