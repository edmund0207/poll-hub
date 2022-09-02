import 'package:flutter/material.dart';
import '../components/backgrounds/welcome_background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/button_card.dart';
import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackGround(
        topImage: 'main_top',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'WELCOME TO POLLHUB',
                style: kTitleTextStyle,
              ),
            ),
            SvgPicture.asset(
              'icons/chat.svg',
              height: size.height * 0.45,
            ),
            const SizedBox(height: 50.0),
            ButtonCard(
              onPress: () {
                setState(() {
                  Navigator.pushNamed(context, '/loginScreen');
                });
              },
              color: kPrimaryColor,
              text: 'GET STARTED',
              style: kButtonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
