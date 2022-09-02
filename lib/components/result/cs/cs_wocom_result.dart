import 'package:untitled/components/display_result.dart';
import '../../../database/candidates.dart';
import 'package:flutter/material.dart';
import '../../result_heading.dart';

class CSWOCOMResult extends StatelessWidget {
  const CSWOCOMResult({Key? key, required this.candidate1}) : super(key: key);

  final int candidate1;
  @override
  Widget build(BuildContext context) {
    int total = candidate1;
    return Column(
      children: [
        const ResultHeader(text: "WOMEN'S COMMISSIONER"),
        CandidateResultCard(
          text: cosWomenCommissioner[0],
          image: "images/cos_wocom_candidate1.jpg",
          count: candidate1,
          percent: (candidate1 / total) * 100,
        ),
      ],
    );
  }
}
