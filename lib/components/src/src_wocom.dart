import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int srcWocomCandidate1 = 0;
int srcWocomCandidate2 = 0;
int srcWocomCandidate3 = 0;
int srcWocomCandidate4 = 0;
int srcWocomCandidate5 = 0;

class SRCWOCOM extends StatefulWidget {
  const SRCWOCOM({
    Key? key,
  }) : super(key: key);

  @override
  State<SRCWOCOM> createState() => _SRCWOCOMState();
}

class _SRCWOCOMState extends State<SRCWOCOM>
    with AutomaticKeepAliveClientMixin {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool isPressed5 = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: kPrimaryLightColor,
      ),
      child: Column(
        children: [
          Text(
            'SRC WOMEN\'S COMMISSIONER',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kPrimaryColor),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = true;
                isPressed2 = false;
                isPressed3 = false;
                isPressed4 = false;
                isPressed5 = false;

                srcWocomCandidate1 = 1;
                srcWocomCandidate2 = 0;
                srcWocomCandidate3 = 0;
                srcWocomCandidate4 = 0;
                srcWocomCandidate5 = 0;
              });
            },
            child: Options(
              text: srcWomenCommissioner[0],
              pressed: isPressed1,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = true;
                isPressed3 = false;
                isPressed4 = false;
                isPressed5 = false;

                srcWocomCandidate1 = 0;
                srcWocomCandidate2 = 1;
                srcWocomCandidate3 = 0;
                srcWocomCandidate4 = 0;
                srcWocomCandidate5 = 0;
              });
            },
            child: Options(
              text: srcWomenCommissioner[1],
              pressed: isPressed2,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = false;
                isPressed3 = true;
                isPressed4 = false;
                isPressed5 = false;

                srcWocomCandidate1 = 0;
                srcWocomCandidate2 = 0;
                srcWocomCandidate3 = 1;
                srcWocomCandidate4 = 0;
                srcWocomCandidate5 = 0;
              });
            },
            child: Options(
              text: srcWomenCommissioner[2],
              pressed: isPressed3,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = false;
                isPressed3 = false;
                isPressed4 = true;
                isPressed5 = false;

                srcWocomCandidate1 = 0;
                srcWocomCandidate2 = 0;
                srcWocomCandidate3 = 0;
                srcWocomCandidate4 = 1;
                srcWocomCandidate5 = 0;
              });
            },
            child: Options(
              text: srcWomenCommissioner[3],
              pressed: isPressed4,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = false;
                isPressed3 = false;
                isPressed4 = false;
                isPressed5 = true;

                srcWocomCandidate1 = 0;
                srcWocomCandidate2 = 0;
                srcWocomCandidate3 = 0;
                srcWocomCandidate4 = 0;
                srcWocomCandidate5 = 1;
              });
            },
            child: Options(
              text: srcWomenCommissioner[4],
              pressed: isPressed5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
