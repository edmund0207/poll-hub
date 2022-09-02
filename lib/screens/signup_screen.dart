import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/components/button_card.dart';
import 'package:untitled/constants.dart';
import '../components/backgrounds/welcome_background.dart';
import '../components/text_field_container.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool visible = true;
  String? email;
  int? studentID;
  String? college;
  int? password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackGround(
        topImage: 'signup_top',
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('SIGNUP', style: kTitleTextStyle),
              SvgPicture.asset(
                'icons/signup.svg',
                height: size.height * 0.3,
              ),
              TextFieldContainer(
                onChange: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                hint: 'Email',
                icon: Icons.email,
                isNotVisible: false,
              ),
              TextFieldContainer(
                onChange: (value) {
                  studentID = value as int;
                },
                keyboardType: TextInputType.number,
                hint: 'Student ID',
                icon: Icons.person,
                isNotVisible: false,
              ),
              TextFieldContainer(
                onChange: (value) {
                  password = value as int;
                },
                hint: 'Password',
                icon: Icons.password,
                isNotVisible: visible,
                onPress: () {
                  setState(() {
                    visible ? visible = false : visible = true;
                  });
                },
                suffixIcon: Icons.visibility,
              ),
              TextFieldContainer(
                onChange: (value) {},
                hint: 'Department',
                icon: Icons.school,
                isNotVisible: false,
              ),
              TextFieldContainer(
                onChange: (value) {
                  college = value;
                },
                hint: 'College',
                icon: Icons.account_balance,
                isNotVisible: false,
              ),
              ButtonCard(
                onPress: () {
                  setState(() {
                    Navigator.pushNamed(context, '/loginScreen');
                  });
                },
                text: 'SIGNUP',
                color: kPrimaryColor,
                style: kButtonTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
