import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int srcFinancialCandidate1 = 0;
int srcFinancialCandidate2 = 0;
int srcFinancialCandidate3 = 0;
int srcFinancialCandidate4 = 0;

class SRCFinancial extends StatefulWidget {
  const SRCFinancial({
    Key? key,
  }) : super(key: key);

  @override
  State<SRCFinancial> createState() => _SRCFinancialState();
}

class _SRCFinancialState extends State<SRCFinancial>
    with AutomaticKeepAliveClientMixin {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;

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
            'SRC FINANCIAL SECRETARY',
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

                srcFinancialCandidate1 = 1;
                srcFinancialCandidate2 = 0;
                srcFinancialCandidate3 = 0;
                srcFinancialCandidate4 = 0;
              });
            },
            child: Options(
              text: srcFinancialSecretary[0],
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

                srcFinancialCandidate1 = 0;
                srcFinancialCandidate2 = 1;
                srcFinancialCandidate3 = 0;
                srcFinancialCandidate4 = 0;
              });
            },
            child: Options(
              text: srcFinancialSecretary[1],
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

                srcFinancialCandidate1 = 0;
                srcFinancialCandidate2 = 0;
                srcFinancialCandidate3 = 1;
                srcFinancialCandidate4 = 0;
              });
            },
            child: Options(
              text: srcFinancialSecretary[2],
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

                srcFinancialCandidate1 = 0;
                srcFinancialCandidate2 = 0;
                srcFinancialCandidate3 = 0;
                srcFinancialCandidate4 = 1;
              });
            },
            child: Options(
              text: srcFinancialSecretary[3],
              pressed: isPressed4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
