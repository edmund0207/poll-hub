import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/components/display_result.dart';
import '../../../database/candidates.dart';
import 'package:flutter/material.dart';
import '../../result_heading.dart';

int candidate1 = 0;
int candidate2 = 0;

class SRCGeneralResult extends StatelessWidget {
  const SRCGeneralResult(
      {Key? key, required this.candidate1, required this.candidate2})
      : super(key: key);

  final int candidate1;
  final int candidate2;

  @override
  Widget build(BuildContext context) {
    int total = candidate1 + candidate2;
    return Column(
      children: [
        const ResultHeader(text: "GENERAL SECRETARY"),
        CandidateResultCard(
          text: srcGeneralSecretary[0],
          image: "images/scisa_general_candidate1.jpg",
          count: candidate1,
          percent: (candidate1 / total) * 100,
        ),
        CandidateResultCard(
          text: srcGeneralSecretary[1],
          image: "images/scisa_general_candidate2.jpg",
          count: candidate2,
          percent: (candidate2 / total) * 100,
        ),
      ],
    );
  }
}
