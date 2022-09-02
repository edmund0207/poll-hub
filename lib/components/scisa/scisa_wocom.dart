import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int scisaWocomCandidate1 = 0;
int scisaWocomCandidate2 = 0;
int scisaWocomCandidate3 = 0;

class SCISAWOCOM extends StatefulWidget {
  const SCISAWOCOM({
    Key? key,
  }) : super(key: key);

  @override
  State<SCISAWOCOM> createState() => _SCISAWOCOMState();
}

class _SCISAWOCOMState extends State<SCISAWOCOM>
    with AutomaticKeepAliveClientMixin {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;

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
            'SCISA WOMEN\'S COMMISSIONER',
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

                scisaWocomCandidate1 = 1;
                scisaWocomCandidate2 = 0;
                scisaWocomCandidate3 = 0;
              });
            },
            child: Options(
              text: scisaWomenCommissioner[0],
              pressed: isPressed1,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = true;
                isPressed3 = false;

                scisaWocomCandidate1 = 0;
                scisaWocomCandidate2 = 1;
                scisaWocomCandidate3 = 0;
              });
            },
            child: Options(
              text: scisaWomenCommissioner[1],
              pressed: isPressed2,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = false;
                isPressed3 = true;

                scisaWocomCandidate1 = 0;
                scisaWocomCandidate2 = 0;
                scisaWocomCandidate3 = 1;
              });
            },
            child: Options(
              text: scisaWomenCommissioner[2],
              pressed: isPressed3,
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
