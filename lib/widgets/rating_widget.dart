import 'package:bookly/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating, required this.maxRating});
  final num rating;
  final int maxRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
        '$maxRating',
          style: Styles.textStyle16.copyWith(color: Colors.white),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          maxRating.toString(),
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        ),
      ],
    );
  }
}
