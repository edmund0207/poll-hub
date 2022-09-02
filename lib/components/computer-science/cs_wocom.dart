import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int csWocomCandidate1 = 0;

class COSWOCOM extends StatefulWidget {
  const COSWOCOM({
    Key? key,
  }) : super(key: key);

  @override
  State<COSWOCOM> createState() => _COSWOCOMState();
}

class _COSWOCOMState extends State<COSWOCOM>
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
            'COS WOMEN\'S COMMISSIONER',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kPrimaryColor),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = true;

                csWocomCandidate1 = 1;
              });
            },
            child: Options(
              text: cosWomenCommissioner[0],
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
