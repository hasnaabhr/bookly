// ignore_for_file: use_build_context_synchronously

import 'package:bookly/widgets/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookly/views/login_view.dart';
import 'package:bookly/widgets/custome_elevatedbutton.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final _formResetKey = GlobalKey<FormState>(); // Correct declaration
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to handle sending the password reset email
  Future<void> _resetPassword() async {
    if (_formResetKey.currentState!.validate()) {
      try {
        await _auth.sendPasswordResetEmail(email: _emailController.text);
        // Display success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password reset email sent!'),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate to login page after successful reset
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      } catch (e) {
        // Display error message

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      height: h,
      child: Stack(
        children: [
          Positioned(
            bottom: 190,
            child: Container(
              height: h * .450,
              width: w,
              decoration: const BoxDecoration(
                color: Color(0xff080808),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.1, vertical: h * 0.02),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formResetKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Reset Your Password",
                            style: Styles.textStyle28,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "We need your E-mail so we can send",
                            style: Styles.textStyle16,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "the password reset code",
                            style: Styles.textStyle16,
                          ),
                          const SizedBox(height: 40),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              fillColor: Color(0xff111111),
                              filled: true,
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomeElevatedbutton(
                            text: 'Send E-mail',
                            onPressed: _resetPassword,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
