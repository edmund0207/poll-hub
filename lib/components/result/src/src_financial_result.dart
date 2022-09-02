import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/components/display_result.dart';
import '../../../database/candidates.dart';
import 'package:flutter/material.dart';
import '../../result_heading.dart';

class SRCFinancialResult extends StatelessWidget {
  const SRCFinancialResult({
    Key? key,
    required this.candidate1,
    required this.candidate2,
    required this.candidate3,
    required this.candidate4,
  }) : super(key: key);

  final int candidate1;
  final int candidate2;
  final int candidate3;
  final int candidate4;

  @override
  Widget build(BuildContext context) {
    int total = candidate1 + candidate2 + candidate3 + candidate4;
    return Column(
      children: [
        const ResultHeader(text: "FINANCIAL SECRETARY"),
        CandidateResultCard(
          text: srcFinancialSecretary[0],
          image: "images/scisa_financial_candidate1.jpg",
          count: candidate1,
          percent: (candidate1 / total) * 100,
        ),
        CandidateResultCard(
          text: srcFinancialSecretary[1],
          image: "images/scisa_financial_candidate2.jpg",
          count: candidate2,
          percent: (candidate2 / total) * 100,
        ),
        CandidateResultCard(
          text: srcFinancialSecretary[2],
          image: "images/scisa_financial_candidate3.jpg",
          count: candidate3,
          percent: (candidate3 / total) * 100,
        ),
        CandidateResultCard(
          text: srcFinancialSecretary[3],
          image: "images/scisa_wocom_candidate3.jpg",
          count: candidate4,
          percent: (candidate4 / total) * 100,
        ),
      ],
    );
  }
}
