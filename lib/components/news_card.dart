import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.image,
    Key? key,
  }) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing '
            'elit. Mauris risus quam, accumsan eget posuere nec, rutrum '
            'eget odio. Donec vestibulum quam vitae ligula luctus, ac.'
            'elit. Mauris risus quam, accumsan eget posuere nec, rutrum ',
            style: kNewsTextStyle,
          ),
          const Divider(
            height: 40,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
