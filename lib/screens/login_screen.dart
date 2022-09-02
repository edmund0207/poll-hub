import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/alerts/error_details_message.dart';
import '../components/alerts/exit_alert.dart';
import '../components/backgrounds/login_background.dart';
import '../constants.dart';
import '../components/button_card.dart';
import '../components/text_field_container.dart';
import '../database/login_store.dart';
import 'main_screen.dart';
import '../components/login_options.dart';

var details = '';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String studentID = "";
  String password = "";
  bool visible = true;
  bool errorVisible = false;

  void login(String studID, String pass) {
    var details = students.where((element) =>
        element["studentID"] == studID && element["password"] == pass);
    if (details.isNotEmpty) {
      String? name = details.first["firstName"];
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainScreen(
            firstName: name.toString(),
            isGuest: false,
          ),
        ),
      );
    } else {
      setState(() {
        errorVisible = true;
        Timer(
            const Duration(
              seconds: 3,
            ), () {
          setState(() {
            errorVisible = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return onBackButtonPressed(context);
      },
      child: Scaffold(
        body: LoginBackground(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: kTitleTextStyle,
                ),
                SvgPicture.asset(
                  'icons/login.svg',
                  height: size.height * 0.3,
                ),
                Visibility(
                  visible: errorVisible,
                  child: errorLoginMessage(size),
                ),
                TextFieldContainer(
                  onChange: (value) {
                    studentID = value;
                  },
                  keyboardType: TextInputType.number,
                  hint: 'Student ID',
                  icon: Icons.person,
                  isNotVisible: false,
                ),
                TextFieldContainer(
                  onChange: (value) {
                    password = value;
                  },
                  hint: 'Password',
                  icon: Icons.lock,
                  isNotVisible: visible,
                  onPress: () {
                    setState(() {
                      visible ? visible = false : visible = true;
                    });
                  },
                  suffixIcon:
                      visible ? Icons.visibility_off_sharp : Icons.visibility,
                ),
                ButtonCard(
                  color: kPrimaryColor,
                  text: 'LOGIN',
                  onPress: () {
                    login(studentID, password);
                  },
                  style: kButtonTextStyle,
                ),
                const SizedBox(height: 10),
                const LoginOptions(text: 'Forgot password?'),
                LoginOptions(
                  text: 'Login as guest',
                  onPress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const MainScreen(firstName: 'Guest', isGuest: true),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
