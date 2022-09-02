import 'package:flutter/material.dart';
import 'package:untitled/components/backgrounds/pages_background.dart';
import 'package:untitled/constants.dart';
import 'loader_skeleton.dart';

class HomeLoader extends StatelessWidget {
  const HomeLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageBackground(
      title: const Text(
        'PollHub',
        style: kTitleTextStyle,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 13.0, left: 15.0, right: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Loader(
                    height: 80,
                    width: 80,
                    radius: 40,
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Loader(
                        height: 25,
                        width: 150,
                        radius: 10,
                      ),
                      const SizedBox(height: 10),
                      Loader(
                        height: 20,
                        width: size.width * 0.65,
                        radius: 16,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Loader(
                  height: 200,
                  width: size.width * 0.85,
                  radius: 10,
                ),
              ),
              const SizedBox(height: 20),
              const Loader(
                height: 20,
                width: 200,
                radius: 16,
              ),
              const SizedBox(height: 20),
              const Center(
                child: Loader(
                  height: 170,
                  width: double.infinity,
                  radius: 10,
                ),
              ),
              const SizedBox(height: 15),
              const Loader(
                height: 20,
                width: double.infinity,
                radius: 16,
              ),
              const SizedBox(height: 8),
              const Loader(
                height: 20,
                width: double.infinity,
                radius: 16,
              ),
              const SizedBox(height: 8),
              const Loader(
                height: 20,
                width: double.infinity,
                radius: 16,
              ),
              const SizedBox(height: 8),
              const Loader(
                height: 20,
                width: double.infinity,
                radius: 16,
              ),
              const SizedBox(height: 8),
              const Loader(
                height: 20,
                width: 200,
                radius: 16,
              ),
              const SizedBox(height: 8),
              const Center(
                child: Loader(
                  height: 170,
                  width: double.infinity,
                  radius: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
