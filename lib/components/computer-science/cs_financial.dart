import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int csFinancialCandidate1 = 0;

class COSFinancial extends StatefulWidget {
  const COSFinancial({
    Key? key,
  }) : super(key: key);

  @override
  State<COSFinancial> createState() => _COSFinancialState();
}

class _COSFinancialState extends State<COSFinancial>
    with AutomaticKeepAliveClientMixin {
  bool isPressed1 = false;

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
            'COS FINANCIAL SECRETARY',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kPrimaryColor),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = true;
                csFinancialCandidate1 = 1;
              });
            },
            child: Options(
              text: cosFinancialSecretary[0],
              pressed: isPressed1,
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
