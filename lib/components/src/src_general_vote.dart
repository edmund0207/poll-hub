import 'package:flutter/material.dart';
import 'package:untitled/components/src/src_financial.dart';
import 'package:untitled/components/src/src_general_secretary.dart';
import 'package:untitled/components/src/src_president.dart';
import 'package:untitled/components/src/src_wocom.dart';
import 'package:untitled/components/vote_complete.dart';
import '../submit_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List posts = const [
  SRCPresident(),
  SRCFinancial(),
  SRCSecretary(),
  SRCWOCOM(),
];

class SRCVote extends StatefulWidget {
  const SRCVote({Key? key}) : super(key: key);

  @override
  State<SRCVote> createState() => _SRCVoteState();
}

class _SRCVoteState extends State<SRCVote> with AutomaticKeepAliveClientMixin {
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
    final votes =
        FirebaseFirestore.instance.collection('votes').doc('src-president');
    final srcFinancialVotes =
        FirebaseFirestore.instance.collection('votes').doc('src-financial');
    final srcGeneralSecVotes = FirebaseFirestore.instance
        .collection('votes')
        .doc('src-general-secretary');
    final srcWocomVotes = FirebaseFirestore.instance
        .collection('votes')
        .doc('src-womens-commissioner');
    return Column(
      children: [
        Expanded(
          child: Scrollbar(
            child: ListView.separated(
                addAutomaticKeepAlives: true,
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
        SubmitButton(onPressed: () async {
          DocumentSnapshot srcPresident = await FirebaseFirestore.instance
              .collection('votes')
              .doc('src-president')
              .get();

          DocumentSnapshot srcFinancial = await FirebaseFirestore.instance
              .collection('votes')
              .doc('src-financial')
              .get();

          DocumentSnapshot srcGeneral = await FirebaseFirestore.instance
              .collection('votes')
              .doc('src-general-secretary')
              .get();
          DocumentSnapshot srcWocom = await FirebaseFirestore.instance
              .collection('votes')
              .doc('src-womens-commissioner')
              .get();

          int presidentCandidate1 = srcPresident['candidate-1'];
          int presidentCandidate2 = srcPresident['candidate-2'];
          int presidentCandidate3 = srcPresident['candidate-3'];
          int presidentCandidate4 = srcPresident['candidate-4'];
          int presidentCandidate5 = srcPresident['candidate-5'];
          int presidentCandidate6 = srcPresident['candidate-6'];
          int financialCandidate1 = srcFinancial['candidate-1'];
          int financialCandidate2 = srcFinancial['candidate-2'];
          int financialCandidate3 = srcFinancial['candidate-3'];
          int financialCandidate4 = srcFinancial['candidate-4'];
          int generalCandidate1 = srcGeneral['candidate-1'];
          int generalCandidate2 = srcGeneral['candidate-2'];
          int wocomCandidate1 = srcWocom['candidate-1'];
          int wocomCandidate2 = srcWocom['candidate-1'];
          int wocomCandidate3 = srcWocom['candidate-1'];
          int wocomCandidate4 = srcWocom['candidate-1'];
          int wocomCandidate5 = srcWocom['candidate-1'];

          presidentCandidate1 += srcPresidentCandidate1;
          presidentCandidate2 += srcPresidentCandidate2;
          presidentCandidate3 += srcPresidentCandidate3;
          presidentCandidate4 += srcPresidentCandidate4;
          presidentCandidate5 += srcPresidentCandidate5;
          presidentCandidate6 += srcPresidentCandidate6;

          votes.update({
            'candidate-1': presidentCandidate1,
            'candidate-2': presidentCandidate2,
            'candidate-3': presidentCandidate3,
            'candidate-4': presidentCandidate4,
            'candidate-5': presidentCandidate5,
            'candidate-6': presidentCandidate6,
          });

          financialCandidate1 += srcFinancialCandidate1;
          financialCandidate2 += srcFinancialCandidate2;
          financialCandidate3 += srcFinancialCandidate3;
          financialCandidate4 += srcFinancialCandidate4;

          srcFinancialVotes.update({
            'candidate-1': financialCandidate1,
            'candidate-2': financialCandidate2,
            'candidate-3': financialCandidate3,
            'candidate-4': financialCandidate4,
          });

          generalCandidate1 += srcGeneralCandidate1;
          generalCandidate2 += srcGeneralCandidate2;

          srcGeneralSecVotes.update({
            'candidate-1': generalCandidate1,
            'candidate-2': generalCandidate2,
          });

          wocomCandidate1 += srcWocomCandidate1;
          wocomCandidate2 += srcWocomCandidate2;
          wocomCandidate3 += srcWocomCandidate3;
          wocomCandidate4 += srcWocomCandidate4;
          wocomCandidate5 += srcWocomCandidate5;

          srcWocomVotes.update({
            'candidate-1': wocomCandidate1,
            'candidate-2': wocomCandidate2,
            'candidate-3': wocomCandidate3,
            'candidate-4': wocomCandidate4,
            'candidate-5': wocomCandidate5,
          });

          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              isComplete = true;
            });
          });
        }),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
