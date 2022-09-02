import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../database/candidates.dart';
import '../candidate_option.dart';

int csOrganizingCandidate1 = 0;

class COSOrganizing extends StatefulWidget {
  const COSOrganizing({
    Key? key,
  }) : super(key: key);

  @override
  State<COSOrganizing> createState() => _COSOrganizingState();
}

class _COSOrganizingState extends State<COSOrganizing>
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
            'COS ORGANIZING SECRETARY',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kPrimaryColor),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = true;
                csOrganizingCandidate1 = 1;
              });
            },
            child: Options(
              text: cosOrganisingSecretary[0],
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
