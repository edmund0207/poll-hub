import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/result/scisa/scisa_financial_result.dart';
import 'package:untitled/components/result/scisa/scisa_generalSec_result.dart';
import 'package:untitled/components/result/scisa/scisa_organizing_result.dart';
import 'package:untitled/components/result/scisa/scisa_president_result.dart';
import 'package:untitled/components/result/scisa/scisa_wocom_result.dart';
import 'package:untitled/constants.dart';

class SCISAResult extends StatefulWidget {
  const SCISAResult({Key? key}) : super(key: key);

  @override
  State<SCISAResult> createState() => _SCISAResultState();
}

class _SCISAResultState extends State<SCISAResult> {
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
            'COLLEGE OF SCIENCE',
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
          DocumentSnapshot scisaOrganizing = await FirebaseFirestore.instance
              .collection('college-of-science')
              .doc('scisa-organizing-secretary')
              .get();
          DocumentSnapshot scisaWocom = await FirebaseFirestore.instance
              .collection('college-of-science')
              .doc('scisa-womens-commissioner')
              .get();

          setState(() {
            presidentCandidate1 = scisaPresident['candidate-1'];
            presidentCandidate2 = scisaPresident['candidate-2'];
            presidentCandidate3 = scisaPresident['candidate-3'];
            presidentCandidate4 = scisaPresident['candidate-4'];
            presidentCandidate5 = scisaPresident['candidate-5'];

            financialCandidate1 = scisaFinancial['candidate-1'];
            financialCandidate2 = scisaFinancial['candidate-2'];
            financialCandidate3 = scisaFinancial['candidate-3'];

            generalCandidate1 = scisaGeneral['candidate-1'];
            generalCandidate2 = scisaGeneral['candidate-2'];
            generalCandidate3 = scisaGeneral['candidate-3'];
            generalCandidate4 = scisaGeneral['candidate-4'];
            generalCandidate5 = scisaGeneral['candidate-5'];

            organizingCandidate1 = scisaOrganizing['candidate-1'];

            wocomCandidate1 = scisaWocom['candidate-1'];
            wocomCandidate2 = scisaWocom['candidate-2'];
            wocomCandidate3 = scisaWocom['candidate-3'];
          });
        },
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SCISAPresidentResult(
              candidate1: presidentCandidate1,
              candidate2: presidentCandidate2,
              candidate3: presidentCandidate3,
              candidate4: presidentCandidate4,
              candidate5: presidentCandidate5,
            ),
            SCISAFinancialResult(
              candidate1: financialCandidate1,
              candidate2: financialCandidate2,
              candidate3: financialCandidate3,
            ),
            SCISAGeneralResult(
              candidate1: generalCandidate1,
              candidate2: generalCandidate2,
              candidate3: generalCandidate3,
              candidate4: generalCandidate4,
              candidate5: generalCandidate5,
            ),
            SCISAWOCOMResult(
              candidate1: wocomCandidate1,
              candidate2: wocomCandidate2,
              candidate3: wocomCandidate3,
            ),
            SCISAOrganizingResult(
              candidate1: organizingCandidate1,
            ),
          ],
        ),
      ),
    );
  }
}
