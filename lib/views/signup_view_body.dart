import 'package:bookly/auth/auth_service.dart';
import 'package:bookly/views/login_view.dart';
import 'package:bookly/widgets/custome_elevatedbutton.dart';
import 'package:bookly/widgets/custome_text_field.dart';
import 'package:bookly/widgets/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _confirmPassword;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // يسمح بتغيير حجم الشاشة عند ظهور لوحة المفاتيح
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); // لإخفاء لوحة المفاتيح عند النقر خارج الحقول
        },
        child: SingleChildScrollView(
          // لتجنب ظهور نصف الشاشة عند الكتابة
          child: SizedBox(
            width: w,
            height: h,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: h * .800,
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
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Get Started",
                                  style: Styles.textStyle28,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Enter your details below",
                                  style: Styles.textStyle16,
                                ),
                                const SizedBox(height: 30),
                                CustomeTextField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your E-mail';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _email = value;
                                  },
                                  obscureText: false,
                                  labelName: 'E-mail',
                                  hintText: 'Enter Your E-mail',
                                ),
                                const SizedBox(height: 20),
                                CustomeTextField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your Password';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _password = value;
                                  },
                                  obscureText: true,
                                  labelName: 'Password',
                                  hintText: 'Enter Your Password',
                                ),
                                const SizedBox(height: 20),
                                CustomeTextField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Confirm Your Password';
                                    }
                                    if (_confirmPassword != _password) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _confirmPassword = value;
                                  },
                                  obscureText: true,
                                  labelName: 'Confirm Password',
                                  hintText: 'Confirm Your Password',
                                ),
                                const SizedBox(height: 30),
                                if (_errorMessage != null)
                                  Text(
                                    _errorMessage!,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                const SizedBox(height: 30),
                                CustomeElevatedbutton(
                                  text: 'Sign Up',
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      try {
                                        await _authService.signUp(
                                            _email!, _password!);
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginView()));
                                      } on FirebaseAuthException catch (e) {
                                        setState(() {
                                          _errorMessage = e.message;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        _errorMessage =
                                            'Passwords do not match';
                                      });
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.7,
                                        color: const Color(0xff808080)
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        'Or Continue With',
                                        style:
                                            TextStyle(color: Color(0xffFBFBFB)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.7,
                                        color: const Color(0xff808080)
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/g.png',
                                      width: 80,
                                      height: 80,
                                    ),
                                    Image.asset(
                                      'assets/images/a.png',
                                      width: 80,
                                      height: 80,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Already have an account?',
                                      style: TextStyle(
                                          color: Color(0xff808080),
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginView()));
                                      },
                                      child: const Text(
                                        'Log In',
                                        style: Styles.textStyle18,
                                      ),
                                    )
                                  ],
                                )
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
          ),
        ),
      ),
    );
  }
}
