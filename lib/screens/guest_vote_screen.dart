import 'package:flutter/material.dart';
import 'package:untitled/components/backgrounds/pages_background.dart';

import '../constants.dart';

class GuestVoteScreen extends StatelessWidget {
  const GuestVoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageBackground(
      title: Text(
        'PollHub',
        style: kTitleTextStyle,
      ),
      child: Center(
        child: Text(
          'Page is currently unavailable to guests',
          style: kOptionsTextStyle,
        ),
      ),
    );
  }
}
