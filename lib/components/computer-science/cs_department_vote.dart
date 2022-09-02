import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/computer-science/cs_financial.dart';
import 'package:untitled/components/computer-science/cs_general_secretary.dart';
import 'package:untitled/components/computer-science/cs_organising_secretary.dart';
import 'package:untitled/components/computer-science/cs_president.dart';
import 'package:untitled/components/computer-science/cs_wocom.dart';

import '../submit_button.dart';
import '../vote_complete.dart';

List posts = const [
  COSPresident(),
  COSFinancial(),
  COSGeneral(),
  COSWOCOM(),
  COSOrganizing()
];

class CSVote extends StatefulWidget {
  const CSVote({Key? key}) : super(key: key);

  @override
  State<CSVote> createState() => _CSVoteState();
}

class _CSVoteState extends State<CSVote>
    with AutomaticKeepAliveClientMixin<CSVote> {
  late bool isComplete;
  @override
  void initState() {
    isComplete = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isComplete ? const VoteComplete() : buildVotes();
  }

  Column buildVotes() {
    final csPresidentVotes = FirebaseFirestore.instance
        .collection('computer-science')
        .doc('cs-president');
    final csFinancialvotes = FirebaseFirestore.instance
        .collection('computer-science')
        .doc('cs-financial');
    final csGeneralSecvotes = FirebaseFirestore.instance
        .collection('computer-science')
        .doc('cs-general-secretary');
    final csWocomVotes = FirebaseFirestore.instance
        .collection('computer-science')
        .doc('cs-womens-commissioner');
    final csOrganizingVotes = FirebaseFirestore.instance
        .collection('computer-science')
        .doc('cs-organizing-secretary');

    return Column(
      children: [
        Expanded(
          child: Scrollbar(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return posts[index];
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: posts.length),
          ),
        ),
        const SizedBox(height: 20),
        SubmitButton(
          onPressed: () async {
            DocumentSnapshot csPresident = await FirebaseFirestore.instance
                .collection('computer-science')
                .doc('cs-president')
                .get();

            DocumentSnapshot csFinancial = await FirebaseFirestore.instance
                .collection('computer-science')
                .doc('cs-financial')
                .get();

            DocumentSnapshot csGeneral = await FirebaseFirestore.instance
                .collection('computer-science')
                .doc('cs-general-secretary')
                .get();
            DocumentSnapshot csWocom = await FirebaseFirestore.instance
                .collection('computer-science')
                .doc('cs-womens-commissioner')
                .get();
            DocumentSnapshot csOrganizing = await FirebaseFirestore.instance
                .collection('computer-science')
                .doc('cs-organizing-secretary')
                .get();

            int presidentCandidate1 = csPresident['candidate-1'];
            int presidentCandidate2 = csPresident['candidate-2'];
            int presidentCandidate3 = csPresident['candidate-3'];
            int financialCandidate1 = csFinancial['candidate-1'];
            int generalCandidate1 = csGeneral['candidate-1'];
            int wocomCandidate1 = csWocom['candidate-1'];
            int organizingCandiate1 = csOrganizing['candidate-1'];

            presidentCandidate1 += csPresidentCandidate1;
            presidentCandidate2 += csPresidentCandidate2;
            presidentCandidate3 += csPresidentCandidate3;

            csPresidentVotes.update({
              'candidate-1': presidentCandidate1,
              'candidate-2': presidentCandidate2,
              'candidate-3': presidentCandidate3,
            });

            financialCandidate1 += csFinancialCandidate1;
            csFinancialvotes.update({
              'candidate-1': financialCandidate1,
            });

            generalCandidate1 += csGeneralCandidate1;
            csGeneralSecvotes.update({
              'candidate-1': generalCandidate1,
            });

            wocomCandidate1 += csWocomCandidate1;
            csWocomVotes.update({
              'candidate-1': wocomCandidate1,
            });

            wocomCandidate1 += csWocomCandidate1;
            csWocomVotes.update({
              'candidate-1': wocomCandidate1,
            });

            organizingCandiate1 += csOrganizingCandidate1;
            csOrganizingVotes.update({
              'candidate-1': organizingCandiate1,
            });
            Future.delayed(const Duration(seconds: 1),
                () => setState(() => isComplete = true));
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
