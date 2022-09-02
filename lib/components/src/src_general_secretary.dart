import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int srcGeneralCandidate1 = 0;
int srcGeneralCandidate2 = 0;

class SRCSecretary extends StatefulWidget {
  const SRCSecretary({
    Key? key,
  }) : super(key: key);

  @override
  State<SRCSecretary> createState() => _SRCSecretaryState();
}

class _SRCSecretaryState extends State<SRCSecretary>
    with AutomaticKeepAliveClientMixin {
  bool isPressed1 = false;
  bool isPressed2 = false;

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
            'SRC GENERAL SECRETARY',
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

                srcGeneralCandidate1 = 1;
                srcGeneralCandidate2 = 0;
              });
            },
            child: Options(
              text: srcGeneralSecretary[0],
              pressed: isPressed1,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = true;

                srcGeneralCandidate1 = 0;
                srcGeneralCandidate2 = 1;
              });
            },
            child: Options(
              text: srcGeneralSecretary[1],
              pressed: isPressed2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
