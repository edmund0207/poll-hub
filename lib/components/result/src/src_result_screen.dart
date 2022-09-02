import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/result/src/src_financial_result.dart';
import 'package:untitled/components/result/src/src_generalSec_result.dart';
import 'package:untitled/components/result/src/src_president_result.dart';
import 'package:untitled/components/result/src/src_wocom_result.dart';
import '../../../constants.dart';

class SRCResult extends StatefulWidget {
  const SRCResult({Key? key}) : super(key: key);

  @override
  State<SRCResult> createState() => _SRCResultState();
}

class _SRCResultState extends State<SRCResult> {
  int presidentCandidate1 = 0;
  int presidentCandidate2 = 0;
  int presidentCandidate3 = 0;
  int presidentCandidate4 = 0;
  int presidentCandidate5 = 0;
  int presidentCandidate6 = 0;

  int financialCandidate1 = 0;
  int financialCandidate2 = 0;
  int financialCandidate3 = 0;

  int generalCandidate1 = 0;
  int generalCandidate2 = 0;

  int wocomCandidate1 = 0;
  int wocomCandidate2 = 0;
  int wocomCandidate3 = 0;
  int wocomCandidate4 = 0;
  int wocomCandidate5 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        title: const FittedBox(
          child: Text(
            'SRC RESULTS',
            style: kResultTitleTextStyle,
          ),
        ),
        elevation: 6,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        color: kPrimaryColor,
        onRefresh: () async {
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

          setState(() {
            presidentCandidate1 = srcPresident['candidate-1'];
            presidentCandidate2 = srcPresident['candidate-2'];
            presidentCandidate3 = srcPresident['candidate-3'];
            presidentCandidate4 = srcPresident['candidate-4'];
            presidentCandidate5 = srcPresident['candidate-5'];

            financialCandidate1 = srcFinancial['candidate-1'];
            financialCandidate2 = srcFinancial['candidate-2'];
            financialCandidate3 = srcFinancial['candidate-3'];

            generalCandidate1 = srcGeneral['candidate-1'];
            generalCandidate2 = srcGeneral['candidate-2'];

            wocomCandidate1 = srcWocom['candidate-1'];
            wocomCandidate2 = srcWocom['candidate-2'];
            wocomCandidate3 = srcWocom['candidate-3'];
          });
        },
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SRCPresidentResult(
              candidate1: presidentCandidate1,
              candidate2: presidentCandidate2,
              candidate3: presidentCandidate3,
              candidate4: presidentCandidate4,
              candidate5: presidentCandidate4,
              candidate6: presidentCandidate6,
            ),
            SRCFinancialResult(
              candidate1: financialCandidate1,
              candidate2: financialCandidate2,
              candidate3: financialCandidate3,
              candidate4: financialCandidate3,
            ),
            SRCGeneralResult(
              candidate1: generalCandidate1,
              candidate2: generalCandidate2,
            ),
            SRCWOCOMResult(
              candidate1: wocomCandidate1,
              candidate2: wocomCandidate2,
              candidate3: wocomCandidate3,
              candidate4: wocomCandidate4,
              candidate5: wocomCandidate5,
            ),
          ],
        ),
      ),
    );
  }
}
