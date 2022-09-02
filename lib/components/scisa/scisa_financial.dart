import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int scisaFinancialCandidate1 = 0;
int scisaFinancialCandidate2 = 0;
int scisaFinancialCandidate3 = 0;

class SCISAFinancial extends StatefulWidget {
  const SCISAFinancial({
    Key? key,
  }) : super(key: key);

  @override
  State<SCISAFinancial> createState() => _SCISAFinancialState();
}

class _SCISAFinancialState extends State<SCISAFinancial>
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
            'SCISA FINANCIAL SECRETARY',
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

                scisaFinancialCandidate1 = 1;
                scisaFinancialCandidate2 = 0;
                scisaFinancialCandidate3 = 0;
              });
            },
            child: Options(
              text: scisaFinancialSecretary[0],
              pressed: isPressed1,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = true;
                isPressed3 = false;

                scisaFinancialCandidate1 = 0;
                scisaFinancialCandidate2 = 1;
                scisaFinancialCandidate3 = 0;
              });
            },
            child: Options(
              text: scisaFinancialSecretary[1],
              pressed: isPressed2,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = false;
                isPressed3 = true;

                scisaFinancialCandidate1 = 0;
                scisaFinancialCandidate2 = 0;
                scisaFinancialCandidate3 = 1;
              });
            },
            child: Options(
              text: scisaFinancialSecretary[2],
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
