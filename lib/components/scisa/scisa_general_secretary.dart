import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int scisaGeneralCandidate1 = 0;
int scisaGeneralCandidate2 = 0;
int scisaGeneralCandidate3 = 0;
int scisaGeneralCandidate4 = 0;
int scisaGeneralCandidate5 = 0;

class SCISAGeneral extends StatefulWidget {
  const SCISAGeneral({
    Key? key,
  }) : super(key: key);

  @override
  State<SCISAGeneral> createState() => _SCISAGeneralState();
}

class _SCISAGeneralState extends State<SCISAGeneral>
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
            'SCISA GENERAL SECRETARY',
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

                scisaGeneralCandidate1 = 1;
                scisaGeneralCandidate2 = 0;
                scisaGeneralCandidate3 = 0;
                scisaGeneralCandidate4 = 0;
                scisaGeneralCandidate5 = 0;
              });
            },
            child: Options(
              text: scisaGeneralSecretary[0],
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

                scisaGeneralCandidate1 = 0;
                scisaGeneralCandidate2 = 1;
                scisaGeneralCandidate3 = 0;
                scisaGeneralCandidate4 = 0;
                scisaGeneralCandidate5 = 0;
              });
            },
            child: Options(
              text: scisaGeneralSecretary[1],
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

                scisaGeneralCandidate1 = 0;
                scisaGeneralCandidate2 = 0;
                scisaGeneralCandidate3 = 1;
                scisaGeneralCandidate4 = 0;
                scisaGeneralCandidate5 = 0;
              });
            },
            child: Options(
              text: scisaGeneralSecretary[2],
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

                scisaGeneralCandidate1 = 0;
                scisaGeneralCandidate2 = 0;
                scisaGeneralCandidate3 = 0;
                scisaGeneralCandidate4 = 1;
                scisaGeneralCandidate5 = 0;
              });
            },
            child: Options(
              text: scisaGeneralSecretary[3],
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

                scisaGeneralCandidate1 = 0;
                scisaGeneralCandidate2 = 0;
                scisaGeneralCandidate3 = 0;
                scisaGeneralCandidate4 = 0;
                scisaGeneralCandidate5 = 1;
              });
            },
            child: Options(
              text: scisaGeneralSecretary[4],
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
