// ignore_for_file: prefer_const_constructors

import 'package:bookly/views/home_view.dart';
import 'package:flutter/material.dart';

class CustomeBookDetailsAppBar extends StatelessWidget {
  const CustomeBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            color: const Color(0xff111111),
            borderRadius: BorderRadius.circular(8),
          ),
          width: 40,
          height: 40,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white, // لون الخلفية الأبيض
            shape: BoxShape.circle, // الشكل الدائري
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              size: 24,
              color: Color(0xff111111), // لون الأيقونة
            ),
          ),
        ),
      ],
    );
  }
}
