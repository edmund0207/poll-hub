import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'cs_financial_result.dart';
import 'cs_generalSec_result.dart';
import 'cs_organizing_result.dart';
import 'cs_president_result.dart';
import 'cs_wocom_result.dart';

class COSResult extends StatefulWidget {
  const COSResult({Key? key}) : super(key: key);

  @override
  State<COSResult> createState() => _COSResultState();
}

class _COSResultState extends State<COSResult> {
  int presidentCandidate1 = 0;
  int presidentCandidate2 = 0;
  int presidentCandidate3 = 0;
  int presidentCandidate4 = 0;
  int presidentCandidate5 = 0;
  int financialCandidate1 = 0;
  int financialCandidate2 = 0;
  int financialCandidate3 = 0;
  int generalCandidate1 = 0;
  int generalCandidate2 = 0;
  int generalCandidate3 = 0;
  int generalCandidate4 = 0;
  int generalCandidate5 = 0;
  int organizingCandidate1 = 0;
  int wocomCandidate1 = 0;
  int wocomCandidate2 = 0;
  int wocomCandidate3 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        title: const FittedBox(
          child: Text(
            'COMPUTER SCIENCE',
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

          setState(() {
            presidentCandidate1 = csPresident['candidate-1'];
            presidentCandidate2 = csPresident['candidate-2'];
            presidentCandidate3 = csPresident['candidate-3'];
            financialCandidate1 = csFinancial['candidate-1'];
            generalCandidate1 = csGeneral['candidate-1'];
            organizingCandidate1 = csOrganizing['candidate-1'];
            wocomCandidate1 = csWocom['candidate-1'];
          });
        },
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            CSPresidentResult(
              candidate1: presidentCandidate1,
              candidate2: presidentCandidate2,
              candidate3: presidentCandidate3,
            ),
            CSFinancialResult(
              candidate1: financialCandidate1,
            ),
            CSGeneralResult(
              candidate1: generalCandidate1,
            ),
            CSWOCOMResult(
              candidate1: wocomCandidate1,
            ),
            CSOrganizingResult(
              candidate1: organizingCandidate1,
            )
          ],
        ),
      ),
    );
  }
}
