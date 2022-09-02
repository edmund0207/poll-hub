import 'package:flutter/material.dart';
import '../constants.dart';

class CandidateResultCard extends StatelessWidget {
  const CandidateResultCard(
      {Key? key,
      required this.text,
      required this.image,
      this.count,
      this.percent})
      : super(key: key);

  final String text;
  final String image;
  final int? count;
  final double? percent;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryLightColor,
      margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover, //change image fill type
              ),
            ),
          ),
          SizedBox(
            width: 180,
            child: Text(
              text,
              style: kCandidateResultTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.all(10),
            color: Colors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    "${count} votes",
                    style: kVoteCountTextStyle,
                  ),
                ),
                SizedBox(height: 10),
                FittedBox(
                  child: Text(
                    "(${percent?.toStringAsFixed(2)}%)",
                    style: kVoteCountTextStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
