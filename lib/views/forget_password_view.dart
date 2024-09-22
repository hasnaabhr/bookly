import 'package:bookly/views/forgot_password_view_body.dart';
import 'package:bookly/views/login_view.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
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
                  borderRadius: BorderRadius.circular(8)),
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
                  ))),
        ),
      ),
      body: const ForgotPasswordViewBody(),
    );
  }
}