import 'package:bookly/views/home_view_body.dart';
import 'package:bookly/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff111111),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/SearchView');
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
              color: Colors.white, // لون الأيقونة
            ),
          ),
          const SizedBox(width: 16), // إضافة مساحة صغيرة بين الأيقونات
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
