import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int srcPresidentCandidate1 = 0;
int srcPresidentCandidate2 = 0;
int srcPresidentCandidate3 = 0;
int srcPresidentCandidate4 = 0;
int srcPresidentCandidate6 = 0;
int srcPresidentCandidate5 = 0;

class SRCPresident extends StatefulWidget {
  const SRCPresident({
    Key? key,
  }) : super(key: key);

  @override
  State<SRCPresident> createState() => _SRCPresidentState();
}

class _SRCPresidentState extends State<SRCPresident>
    with AutomaticKeepAliveClientMixin {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool isPressed5 = false;
  bool isPressed6 = false;

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
            'SRC PRESIDENT',
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
                isPressed6 = false;

                srcPresidentCandidate1 = 1;
                srcPresidentCandidate2 = 0;
                srcPresidentCandidate3 = 0;
                srcPresidentCandidate4 = 0;
                srcPresidentCandidate5 = 0;
                srcPresidentCandidate6 = 0;
              });
            },
            child: Options(
              text: srcPresident[0],
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
                isPressed6 = false;

                srcPresidentCandidate1 = 0;
                srcPresidentCandidate2 = 1;
                srcPresidentCandidate3 = 0;
                srcPresidentCandidate4 = 0;
                srcPresidentCandidate5 = 0;
                srcPresidentCandidate6 = 0;
              });
            },
            child: Options(
              text: srcPresident[1],
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
                isPressed6 = false;

                srcPresidentCandidate1 = 0;
                srcPresidentCandidate2 = 0;
                srcPresidentCandidate3 = 1;
                srcPresidentCandidate4 = 0;
                srcPresidentCandidate5 = 0;
                srcPresidentCandidate6 = 0;
              });
            },
            child: Options(
              text: srcPresident[2],
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
                isPressed6 = false;

                srcPresidentCandidate1 = 0;
                srcPresidentCandidate2 = 0;
                srcPresidentCandidate3 = 0;
                srcPresidentCandidate4 = 1;
                srcPresidentCandidate5 = 0;
                srcPresidentCandidate6 = 0;
              });
            },
            child: Options(pressed: isPressed4, text: srcPresident[3]),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = false;
                isPressed3 = false;
                isPressed4 = false;
                isPressed5 = true;
                isPressed6 = false;

                srcPresidentCandidate1 = 0;
                srcPresidentCandidate2 = 0;
                srcPresidentCandidate3 = 0;
                srcPresidentCandidate4 = 0;
                srcPresidentCandidate5 = 1;
                srcPresidentCandidate6 = 0;
              });
            },
            child: Options(pressed: isPressed5, text: srcPresident[4]),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = false;
                isPressed3 = false;
                isPressed4 = false;
                isPressed5 = false;
                isPressed6 = true;

                srcPresidentCandidate1 = 0;
                srcPresidentCandidate2 = 0;
                srcPresidentCandidate3 = 0;
                srcPresidentCandidate4 = 0;
                srcPresidentCandidate5 = 0;
                srcPresidentCandidate6 = 1;
              });
            },
            child: Options(pressed: isPressed6, text: srcPresident[5]),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
