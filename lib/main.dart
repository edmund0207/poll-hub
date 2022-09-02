import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:untitled/components/result/scisa/scisa_result_screen.dart';
import 'package:untitled/components/result/src/src_result_screen.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/screens/login_screen.dart';
import 'package:untitled/screens/main_screen.dart';
import 'package:untitled/screens/results_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'components/result/cs/cs_result_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: AnimatedSplashScreen(
          duration: 1500,
          backgroundColor: Colors.white,
          splashTransition: SplashTransition.slideTransition,
          splashIconSize: 200,
          splash: Column(
            children: const [
              Icon(
                Icons.how_to_vote,
                color: kPrimaryColor,
                size: 100,
              ),
              Text(
                'POLLHUB',
                style: kSplashTextStyle,
              ),
              Text(
                'Voting made Easy',
                style: kMottoTextStyle,
              )
            ],
          ),
          nextScreen: const LoginScreen(),
        ),
        routes: {
          '/loginScreen': (context) => const LoginScreen(),
          '/homeScreen': (context) => const HomeScreen(firstName: ""),
          '/resultScreen': (context) => const ResultScreen(),
          '/mainScreen': (context) => const MainScreen(
                firstName: '',
                isGuest: false,
              ),
          '/srcResultScreen': (context) => const SRCResult(),
          '/scisaResultScreen': (context) => const SCISAResult(),
          '/cosResultScreen': (context) => const COSResult(),
        },
      ),
    );
  }
}
