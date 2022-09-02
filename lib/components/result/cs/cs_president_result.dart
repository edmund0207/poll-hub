import 'package:untitled/components/display_result.dart';
import '../../../database/candidates.dart';
import 'package:flutter/material.dart';
import '../../result_heading.dart';

class CSPresidentResult extends StatelessWidget {
  const CSPresidentResult(
      {Key? key,
      required this.candidate1,
      required this.candidate2,
      required this.candidate3})
      : super(key: key);

  final int candidate1;
  final int candidate2;
  final int candidate3;
  @override
  Widget build(BuildContext context) {
    int total = candidate1 + candidate2 + candidate3;
    return Column(
      children: [
        const ResultHeader(text: "PRESIDENT"),
        CandidateResultCard(
          text: cosPresident[0],
          image: "images/cos_president_candidate1.jpg",
          count: candidate1,
          percent: (candidate1 / total) * 100,
        ),
        CandidateResultCard(
          text: cosPresident[1],
          image: "images/cos_president_candidate2.jpg",
          count: candidate2,
          percent: (candidate2 / total) * 100,
        ),
        CandidateResultCard(
          text: cosPresident[2],
          image: "images/cos_president_candidate3.jpg",
          count: candidate3,
          percent: (candidate3 / total) * 100,
        ),
      ],
    );
  }
}
