import 'package:untitled/components/display_result.dart';
import '../../../database/candidates.dart';
import 'package:flutter/material.dart';
import '../../result_heading.dart';

class CSFinancialResult extends StatelessWidget {
  const CSFinancialResult({Key? key, required this.candidate1})
      : super(key: key);

  final int candidate1;
  @override
  Widget build(BuildContext context) {
    int total = candidate1;
    return Column(
      children: [
        const ResultHeader(text: "FINANCIAL SECRETARY"),
        CandidateResultCard(
          text: cosFinancialSecretary[0],
          image: "images/cos_financial_candidate1.jpg",
          count: candidate1,
          percent: (candidate1 / total) * 100,
        ),
      ],
    );
  }
}
