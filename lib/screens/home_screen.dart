import 'package:flutter/material.dart';
import 'package:untitled/components/loaders/home_screen_loader.dart';
import '../constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../components/news_card.dart';
import '../components/backgrounds/pages_background.dart';
import '../components/alerts/exit_alert.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

class HomeScreen extends StatefulWidget {
  final String firstName;
  final bool? isGuest;
  const HomeScreen({Key? key, required this.firstName, this.isGuest})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  int activeIndex = 0;

  final sliderImages = [
    Image.asset('images/agenda_img1.jpg', fit: BoxFit.cover),
    Image.asset('images/agenda_img2.jpg', fit: BoxFit.cover),
    Image.asset('images/agenda_img3.jpg', fit: BoxFit.cover),
    Image.asset('images/agenda_img4.jpg', fit: BoxFit.cover),
  ];

  late Animation<double> _animation;
  late AnimationController _animationController;
  late bool _isLoading;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: _isLoading
          ? const HomeLoader()
          : PageBackground(
              title: const Text(
                'PollHub',
                style: kTitleTextStyle,
              ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: FloatingActionBubble(
                  items: [
                    Bubble(
                      title: "Apply for a position",
                      iconColor: Colors.white,
                      bubbleColor: kPrimaryColor,
                      icon: Icons.people_rounded,
                      titleStyle: kBubbleTextStyle,
                      onPress: () {
                        // check if user is a guest
                        _animationController.reverse();
                      },
                    ),
                    Bubble(
                      title: "Past Elections",
                      iconColor: Colors.white,
                      bubbleColor: kPrimaryColor,
                      icon: Icons.how_to_vote_rounded,
                      titleStyle: kBubbleTextStyle,
                      onPress: () {
                        _animationController.reverse();
                      },
                    ),
                    Bubble(
                      title: "Setting",
                      iconColor: Colors.white,
                      bubbleColor: kPrimaryColor,
                      icon: Icons.settings,
                      titleStyle: kBubbleTextStyle,
                      onPress: () {
                        _animationController.reverse();
                      },
                    ),
                  ],
                  onPress: () {
                    _animationController.isCompleted
                        ? _animationController.reverse()
                        : _animationController.forward();
                  },
                  animation: _animation,
                  backGroundColor: kPrimaryColor,
                  iconColor: Colors.white,
                  iconData: Icons.menu,
                ),
              ),
              child: Scrollbar(
                radius: const Radius.circular(10),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0, left: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                //set border radius to 50% of square height and width
                                image: const DecorationImage(
                                  image: AssetImage("images/avatar2.jpg"),
                                  fit: BoxFit.cover, //change image fill type
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 8.0, top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, ${widget.firstName}",
                                    style: kNameTextStyle,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    width: 250,
                                    child: const Text(
                                      'Welcome To The No.1 Voting Hub',
                                      style: kWelcomeTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              height: 200.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                            ),
                            itemCount: sliderImages.length,
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              final images = sliderImages[index];
                              return buildImage(images, index);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          buildIndicator(),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Check out the latest news',
                          style: kNewsLabelTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const NewsCard(
                        image: 'images/news_image4.jpg',
                      ),
                      const NewsCard(
                        image: 'images/news_image1.jpg',
                      ),
                      const NewsCard(
                        image: 'images/news_image3.jpg',
                      ),
                      const NewsCard(
                        image: 'images/new_image1.jpg',
                      ),
                      const NewsCard(
                        image: 'images/news_image1.jpg',
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget buildImage(Image images, int index) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: images,
    );
  }

  buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: sliderImages.length,
      effect: const JumpingDotEffect(
        activeDotColor: kPrimaryColor,
        dotHeight: 10,
        dotWidth: 10,
        verticalOffset: 5,
      ),
    );
  }
}
