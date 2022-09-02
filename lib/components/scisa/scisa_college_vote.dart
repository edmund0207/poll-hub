import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/scisa/scisa_financial.dart';
import 'package:untitled/components/scisa/scisa_general_secretary.dart';
import 'package:untitled/components/scisa/scisa_organising_secretary.dart';
import 'package:untitled/components/scisa/scisa_president.dart';
import 'package:untitled/components/scisa/scisa_wocom.dart';
import 'package:untitled/components/submit_button.dart';
import '../vote_complete.dart';

List posts = const [
  SCISAPresident(),
  SCISAFinancial(),
  SCISAGeneral(),
  SCISAWOCOM(),
  SCISAOrganising()
];

class SCISAVote extends StatefulWidget {
  const SCISAVote({Key? key}) : super(key: key);

  @override
  State<SCISAVote> createState() => _SCISAVoteState();
}

class _SCISAVoteState extends State<SCISAVote>
    with AutomaticKeepAliveClientMixin<SCISAVote> {
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
    final scisaPresidentVotes = FirebaseFirestore.instance
        .collection('college-of-science')
        .doc('scisa-president');
    final scisaFinancialvotes = FirebaseFirestore.instance
        .collection('college-of-science')
        .doc('scisa-financial');
    final scisaGeneralSecvotes = FirebaseFirestore.instance
        .collection('college-of-science')
        .doc('scisa-general-secretary');
    final scisaWocomVotes = FirebaseFirestore.instance
        .collection('college-of-science')
        .doc('scisa-womens-commissioner');
    final scisaOrganizingVotes = FirebaseFirestore.instance
        .collection('college-of-science')
        .doc('scisa-organizing-secretary');
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
            DocumentSnapshot scisaPresident = await FirebaseFirestore.instance
                .collection('college-of-science')
                .doc('scisa-president')
                .get();
            DocumentSnapshot scisaFinancial = await FirebaseFirestore.instance
                .collection('college-of-science')
                .doc('scisa-financial')
                .get();
            DocumentSnapshot scisaGeneral = await FirebaseFirestore.instance
                .collection('college-of-science')
                .doc('scisa-general-secretary')
                .get();
            DocumentSnapshot scisaWocom = await FirebaseFirestore.instance
                .collection('college-of-science')
                .doc('scisa-womens-commissioner')
                .get();
            DocumentSnapshot scisaOrganizing = await FirebaseFirestore.instance
                .collection('college-of-science')
                .doc('scisa-organizing-secretary')
                .get();

            int presidentCandidate1 = scisaPresident['candidate-1'];
            int presidentCandidate2 = scisaPresident['candidate-2'];
            int presidentCandidate3 = scisaPresident['candidate-3'];
            int presidentCandidate4 = scisaPresident['candidate-4'];
            int presidentCandidate5 = scisaPresident['candidate-5'];
            int financialCandidate1 = scisaFinancial['candidate-1'];
            int financialCandidate2 = scisaFinancial['candidate-2'];
            int financialCandidate3 = scisaFinancial['candidate-3'];
            int generalCandidate1 = scisaGeneral['candidate-1'];
            int generalCandidate2 = scisaGeneral['candidate-2'];
            int generalCandidate3 = scisaGeneral['candidate-3'];
            int generalCandidate4 = scisaGeneral['candidate-4'];
            int generalCandidate5 = scisaGeneral['candidate-5'];
            int wocomCandidate1 = scisaWocom['candidate-1'];
            int wocomCandidate2 = scisaWocom['candidate-1'];
            int wocomCandidate3 = scisaWocom['candidate-1'];
            int organizingCandiate1 = scisaOrganizing['candidate-1'];

            presidentCandidate1 += scisaPresidentCandidate1;
            presidentCandidate2 += scisaPresidentCandidate2;
            presidentCandidate3 += scisaPresidentCandidate3;
            presidentCandidate4 += scisaPresidentCandidate4;
            presidentCandidate5 += scisaPresidentCandidate5;

            scisaPresidentVotes.update({
              'candidate-1': presidentCandidate1,
              'candidate-2': presidentCandidate2,
              'candidate-3': presidentCandidate3,
              'candidate-4': presidentCandidate4,
              'candidate-5': presidentCandidate5,
            });

            financialCandidate1 += scisaFinancialCandidate1;
            financialCandidate2 += scisaFinancialCandidate2;
            financialCandidate3 += scisaFinancialCandidate3;

            scisaFinancialvotes.update({
              'candidate-1': financialCandidate1,
              'candidate-2': financialCandidate2,
              'candidate-3': financialCandidate3,
            });

            generalCandidate1 += scisaGeneralCandidate1;
            generalCandidate2 += scisaGeneralCandidate2;
            generalCandidate3 += scisaGeneralCandidate3;
            generalCandidate4 += scisaGeneralCandidate4;
            generalCandidate5 += scisaGeneralCandidate5;

            scisaGeneralSecvotes.update({
              'candidate-1': generalCandidate1,
              'candidate-2': generalCandidate2,
              'candidate-3': generalCandidate3,
              'candidate-4': generalCandidate4,
              'candidate-5': generalCandidate5,
            });

            wocomCandidate1 += scisaWocomCandidate1;
            wocomCandidate2 += scisaWocomCandidate2;
            wocomCandidate3 += scisaWocomCandidate3;

            scisaWocomVotes.update({
              'candidate-1': wocomCandidate1,
              'candidate-2': wocomCandidate2,
              'candidate-3': wocomCandidate3,
            });

            organizingCandiate1 += scisaOrganizingCandidate1;
            scisaOrganizingVotes.update({
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
