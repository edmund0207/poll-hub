import 'package:flutter/material.dart';
import 'package:untitled/components/backgrounds/pages_background.dart';
import '../components/alerts/exit_alert.dart';
import '../components/button_card.dart';
import '../constants.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: PageBackground(
        title: const Text(
          'PollHub',
          style: kTitleTextStyle,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, top: 70),
                child: Text(
                  'View Elections Results',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              ButtonCard(
                onPress: () {
                  Navigator.pushNamed(context, '/srcResultScreen');
                },
                text: 'S.R.C',
                color: kPrimaryLightColor,
                style: kResultButtonTextStyle,
              ),
              ButtonCard(
                onPress: () {
                  Navigator.pushNamed(context, '/scisaResultScreen');
                },
                text: 'S.C.I.S.A',
                color: kPrimaryLightColor,
                style: kResultButtonTextStyle,
              ),
              ButtonCard(
                onPress: () {},
                text: 'G.E.S.A',
                color: kPrimaryLightColor,
                style: kResultButtonTextStyle,
              ),
              ButtonCard(
                onPress: () {
                  Navigator.pushNamed(context, '/cosResultScreen');
                },
                text: 'Computer Science',
                color: kPrimaryLightColor,
                style: kResultButtonTextStyle,
              ),
              ButtonCard(
                onPress: () {},
                text: 'Biological Science',
                color: kPrimaryLightColor,
                style: kResultButtonTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
