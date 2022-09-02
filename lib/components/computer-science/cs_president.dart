import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int csPresidentCandidate1 = 0;
int csPresidentCandidate2 = 0;
int csPresidentCandidate3 = 0;

class COSPresident extends StatefulWidget {
  const COSPresident({
    Key? key,
  }) : super(key: key);

  @override
  State<COSPresident> createState() => _COSPresidentState();
}

class _COSPresidentState extends State<COSPresident>
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
            'COS PRESIDENT',
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

                csPresidentCandidate1 = 1;
                csPresidentCandidate2 = 0;
                csPresidentCandidate3 = 0;
              });
            },
            child: Options(
              text: cosPresident[0],
              pressed: isPressed1,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = true;
                isPressed3 = false;

                csPresidentCandidate1 = 0;
                csPresidentCandidate2 = 1;
                csPresidentCandidate3 = 0;
              });
            },
            child: Options(
              text: cosPresident[1],
              pressed: isPressed2,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = false;
                isPressed3 = true;

                csPresidentCandidate1 = 0;
                csPresidentCandidate2 = 0;
                csPresidentCandidate3 = 1;
              });
            },
            child: Options(
              text: cosPresident[2],
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
