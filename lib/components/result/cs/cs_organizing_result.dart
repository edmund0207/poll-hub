import 'package:untitled/components/display_result.dart';
import '../../../database/candidates.dart';
import 'package:flutter/material.dart';
import '../../result_heading.dart';

class CSOrganizingResult extends StatelessWidget {
  const CSOrganizingResult({Key? key, required this.candidate1})
      : super(key: key);

  final int candidate1;
  @override
  Widget build(BuildContext context) {
    int total = candidate1;
    return Column(
      children: [
        const ResultHeader(text: "ORGANIZING SECRETARY"),
        CandidateResultCard(
          text: cosOrganisingSecretary[0],
          image: "images/cos_organizing_candidate1.jpg",
          count: candidate1,
          percent: (candidate1 / total) * 100,
        ),
      ],
    );
  }
}
