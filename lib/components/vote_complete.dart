import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

class VoteComplete extends StatefulWidget {
  const VoteComplete({Key? key}) : super(key: key);

  @override
  State<VoteComplete> createState() => _VoteCompleteState();
}

class _VoteCompleteState extends State<VoteComplete>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.thumb_up_alt_rounded,
              color: kPrimaryColor,
              size: 100,
            ),
            Text(
              'Thanks for voting, have a good day',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
