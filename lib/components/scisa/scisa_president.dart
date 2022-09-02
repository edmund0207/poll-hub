import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int scisaPresidentCandidate1 = 0;
int scisaPresidentCandidate2 = 0;
int scisaPresidentCandidate3 = 0;
int scisaPresidentCandidate4 = 0;
int scisaPresidentCandidate5 = 0;

class SCISAPresident extends StatefulWidget {
  const SCISAPresident({
    Key? key,
  }) : super(key: key);

  @override
  State<SCISAPresident> createState() => _SCISAPresidentState();
}

class _SCISAPresidentState extends State<SCISAPresident>
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
            'SCISA PRESIDENT',
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

                scisaPresidentCandidate1 = 1;
                scisaPresidentCandidate2 = 0;
                scisaPresidentCandidate3 = 0;
                scisaPresidentCandidate4 = 0;
                scisaPresidentCandidate5 = 0;
              });
            },
            child: Options(
              text: scisaPresident[0],
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

                scisaPresidentCandidate1 = 0;
                scisaPresidentCandidate2 = 1;
                scisaPresidentCandidate3 = 0;
                scisaPresidentCandidate4 = 0;
                scisaPresidentCandidate5 = 0;
              });
            },
            child: Options(
              text: scisaPresident[1],
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

                scisaPresidentCandidate1 = 0;
                scisaPresidentCandidate2 = 0;
                scisaPresidentCandidate3 = 1;
                scisaPresidentCandidate4 = 0;
                scisaPresidentCandidate5 = 0;
              });
            },
            child: Options(
              text: scisaPresident[2],
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

                scisaPresidentCandidate1 = 0;
                scisaPresidentCandidate2 = 0;
                scisaPresidentCandidate3 = 0;
                scisaPresidentCandidate4 = 1;
                scisaPresidentCandidate5 = 0;
              });
            },
            child: Options(
              text: scisaPresident[3],
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

                scisaPresidentCandidate1 = 0;
                scisaPresidentCandidate2 = 0;
                scisaPresidentCandidate3 = 0;
                scisaPresidentCandidate4 = 0;
                scisaPresidentCandidate5 = 1;
              });
            },
            child: Options(
              text: scisaPresident[4],
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
