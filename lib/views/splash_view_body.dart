// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToLogin();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/splash.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: AnimatedBuilder(
                animation: slidingAnimation,
                builder: (context, _) {
                  return SlideTransition(
                    position: slidingAnimation,
                    child: Row(
                      children: [
                        Text(
                          'Book',
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 48,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Rubik Moonrocks'),
                        ),
                        Text(
                          'Voyago',
                          style: TextStyle(
                              color: Color(0xffFFD5AC),
                              fontSize: 48,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Rubik Moonrocks'),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    slidingAnimation = Tween<Offset>(begin: Offset(0, 2), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }

  void navigateToLogin() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push('/loginView');
      },
    );
  }
}
