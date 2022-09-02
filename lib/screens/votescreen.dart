import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:untitled/components/scisa/scisa_college_vote.dart';
import 'package:untitled/components/backgrounds/pages_background.dart';
import 'package:untitled/screens/guest_vote_screen.dart';
import '../components/alerts/exit_alert.dart';
import '../components/computer-science/cs_department_vote.dart';
import '../components/src/src_general_vote.dart';
import '../components/alerts/closed_vote_alert.dart';
import '../constants.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({Key? key, required this.isGuest}) : super(key: key);
  final bool isGuest;
  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    TabController tabController = TabController(length: 3, vsync: this);
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: PageBackground(
        title: SlideCountdown(
          showZeroValue: true,
          duration: const Duration(days: 1, hours: 5),
          textStyle: kCountDownTextStyle,
          separator: ':',
          separatorStyle: kCountDownTextStyle,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20.0),
          ),
          onDone: () {
            setState(() {
              voteClosedShowDialog(context);
            });
          },
        ),
        child: widget.isGuest
            ? const GuestVoteScreen()
            : buildVoteScreen(tabController),
      ),
    );
  }

  Column buildVoteScreen(TabController tabController) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            isScrollable: true,
            labelColor: kPrimaryColor,
            labelStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelColor: Colors.grey,
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: CircleTabIndicator(color: kPrimaryColor, radius: 4),
            tabs: const [
              Text('General'),
              Text('College'),
              Text('Department'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: TabBarView(
              controller: tabController,
              children: const [
                SRCVote(),
                SCISAVote(),
                CSVote(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
