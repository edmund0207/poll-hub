import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/components/display_result.dart';
import '../../../database/candidates.dart';
import 'package:flutter/material.dart';
import '../../result_heading.dart';

class SCISAOrganizingResult extends StatefulWidget {
  const SCISAOrganizingResult({Key? key, required this.candidate1})
      : super(key: key);
  final int candidate1;
  @override
  State<SCISAOrganizingResult> createState() => _SCISAOrganizingResultState();
}

class _SCISAOrganizingResultState extends State<SCISAOrganizingResult> {
  @override
  Widget build(BuildContext context) {
    int total = widget.candidate1;
    return Column(
      children: [
        const ResultHeader(text: "ORGANIZING SECRETARY"),
        CandidateResultCard(
          text: scisaOrganisingSecretary[0],
          image: "images/scisa_organizing_candidate1.jpg",
          count: widget.candidate1,
          percent: (widget.candidate1 / total) * 100,
        ),
      ],
    );
  }
}
