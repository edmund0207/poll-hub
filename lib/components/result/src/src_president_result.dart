import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/components/display_result.dart';
import '../../../database/candidates.dart';
import 'package:flutter/material.dart';
import '../../result_heading.dart';

int candidate1 = 0;
int candidate2 = 0;
int candidate3 = 0;
int candidate4 = 0;
int candidate5 = 0;
int candidate6 = 0;

class SRCPresidentResult extends StatelessWidget {
  const SRCPresidentResult(
      {Key? key,
      required this.candidate1,
      required this.candidate2,
      required this.candidate3,
      required this.candidate4,
      required this.candidate5,
      required this.candidate6})
      : super(key: key);

  final int candidate1;
  final int candidate2;
  final int candidate3;
  final int candidate4;
  final int candidate5;
  final int candidate6;

  @override
  Widget build(BuildContext context) {
    int total = candidate1 + candidate2 + candidate3 + candidate4 + candidate5;
    return Column(
      children: [
        const ResultHeader(text: "PRESIDENT"),
        CandidateResultCard(
          text: srcPresident[0],
          image: "images/scisa_organizing_candidate1.jpg",
          count: candidate1,
          percent: (candidate1 / total) * 100,
        ),
        CandidateResultCard(
            text: srcPresident[1],
            image: "images/scisa_president_candidate1.jpg",
            count: candidate2,
            percent: (candidate2 / total) * 100),
        CandidateResultCard(
          text: srcPresident[2],
          image: "images/scisa_president_candidate2.jpg",
          count: candidate3,
          percent: (candidate3 / total) * 100,
        ),
        CandidateResultCard(
            text: srcPresident[3],
            image: "images/scisa_president_candidate3.jpg",
            count: candidate4,
            percent: (candidate4 / total) * 100),
        CandidateResultCard(
            text: srcPresident[4],
            image: "images/scisa_president_candidate4.jpg",
            count: candidate5,
            percent: (candidate5 / total) * 100),
        CandidateResultCard(
            text: srcPresident[5],
            image: "images/scisa_president_candidate5.jpg",
            count: candidate6,
            percent: (candidate6 / total) * 100),
      ],
    );
  }
}
