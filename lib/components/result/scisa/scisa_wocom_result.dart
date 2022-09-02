import 'package:untitled/components/display_result.dart';
import '../../../database/candidates.dart';
import 'package:flutter/material.dart';
import '../../result_heading.dart';

class SCISAWOCOMResult extends StatefulWidget {
  const SCISAWOCOMResult(
      {Key? key,
      required this.candidate1,
      required this.candidate2,
      required this.candidate3})
      : super(key: key);
  final int candidate1;
  final int candidate2;
  final int candidate3;
  @override
  State<SCISAWOCOMResult> createState() => _SCISAWOCOMResultState();
}

class _SCISAWOCOMResultState extends State<SCISAWOCOMResult> {
  @override
  Widget build(BuildContext context) {
    int total = widget.candidate1 + widget.candidate2 + widget.candidate3;
    return Column(
      children: [
        const ResultHeader(text: "WOMEN'S COMMISSIONER"),
        CandidateResultCard(
          text: scisaWomenCommissioner[0],
          image: "images/scisa_wocom_candidate1.jpg",
          count: widget.candidate1,
          percent: (widget.candidate1 / total) * 100,
        ),
        CandidateResultCard(
          text: scisaWomenCommissioner[1],
          image: "images/scisa_wocom_candidate2.jpg",
          count: widget.candidate2,
          percent: (widget.candidate2 / total) * 100,
        ),
        CandidateResultCard(
          text: scisaWomenCommissioner[2],
          image: "images/scisa_wocom_candidate3.jpg",
          count: widget.candidate3,
          percent: (widget.candidate3 / total) * 100,
        ),
      ],
    );
  }
}
