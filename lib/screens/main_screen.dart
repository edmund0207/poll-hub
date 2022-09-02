import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:untitled/screens/guest_vote_screen.dart';
import 'package:untitled/screens/results_screen.dart';
import 'package:untitled/screens/votescreen.dart';
import '../components/alerts/logout_alert.dart';
import '../constants.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.firstName, required this.isGuest})
      : super(key: key);
  final String firstName;
  final bool isGuest;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String name = widget.firstName;

    List screens = [
      HomeScreen(firstName: name, isGuest: false),
      const VotingScreen(isGuest: false),
      const ResultScreen(),
      const LogoutScreen()
    ];

    List guestScreens = [
      HomeScreen(firstName: name, isGuest: true),
      const VotingScreen(isGuest: true),
      const ResultScreen(),
      const LogoutScreen()
    ];

    return Scaffold(
      body: widget.isGuest ? guestScreens[currentIndex] : screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFF7F5D84),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Vote',
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.celebration),
            label: 'Results',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_sharp),
            label: 'Logout',
            backgroundColor: Color(0xFF9663c6),
          ),
        ],
      ),
    );
  }
}
