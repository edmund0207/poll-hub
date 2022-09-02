import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/components/display_result.dart';
import '../../../database/candidates.dart';
import 'package:flutter/material.dart';
import '../../result_heading.dart';

class SCISAPresidentResult extends StatefulWidget {
  const SCISAPresidentResult({
    Key? key,
    required this.candidate1,
    required this.candidate2,
    required this.candidate3,
    required this.candidate4,
    required this.candidate5,
  }) : super(key: key);

  final int candidate1;
  final int candidate2;
  final int candidate3;
  final int candidate4;
  final int candidate5;
  @override
  State<SCISAPresidentResult> createState() => _SCISAPresidentResultState();
}

class _SCISAPresidentResultState extends State<SCISAPresidentResult> {
  @override
  Widget build(BuildContext context) {
    int total = widget.candidate1 +
        widget.candidate2 +
        widget.candidate3 +
        widget.candidate4 +
        widget.candidate5;
    return Column(
      children: [
        const ResultHeader(text: "PRESIDENT"),
        CandidateResultCard(
          text: scisaPresident[0],
          image: "images/scisa_president_candidate1.jpg",
          count: widget.candidate1,
          percent: (widget.candidate1 / total) * 100,
        ),
        CandidateResultCard(
          text: scisaPresident[1],
          image: "images/scisa_president_candidate2.jpg",
          count: widget.candidate2,
          percent: (widget.candidate2 / total) * 100,
        ),
        CandidateResultCard(
          text: scisaPresident[2],
          image: "images/scisa_president_candidate3.jpg",
          count: widget.candidate3,
          percent: (widget.candidate3 / total) * 100,
        ),
        CandidateResultCard(
          text: scisaPresident[3],
          image: "images/scisa_president_candidate4.jpg",
          count: widget.candidate4,
          percent: (widget.candidate4 / total) * 100,
        ),
        CandidateResultCard(
          text: scisaPresident[4],
          image: "images/scisa_president_candidate5.jpg",
          count: widget.candidate5,
          percent: (widget.candidate5 / total) * 100,
        ),
      ],
    );
  }
}
