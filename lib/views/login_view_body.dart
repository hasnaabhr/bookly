// ignore_for_file: prefer_const_constructors

import 'package:bookly/auth/auth_service.dart';
import 'package:bookly/views/forget_password_view.dart';
import 'package:bookly/views/home_view.dart';
import 'package:bookly/views/signup_view.dart';
import 'package:bookly/widgets/custome_elevatedbutton.dart';
import 'package:bookly/widgets/custome_text_field.dart';
import 'package:bookly/widgets/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _errorMessage;

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
            bottom: 0,
            child: Container(
              height: h * .650,
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
                          Text(
                            "Welcome Back!",
                            style: Styles.textStyle28,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Enter your details below",
                            style: Styles.textStyle16,
                          ),
                          SizedBox(height: 30),
                          CustomeTextField(
                            validator: (Value) {
                              if (Value == null || Value.isEmpty) {
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
                          SizedBox(height: 20),
                          CustomeTextField(
                            validator: (Value) {
                              if (Value == null || Value.isEmpty) {
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
                          SizedBox(height: 10),
                          if (_errorMessage != null)
                            Text(
                              _errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ForgetPasswordView();
                                }));
                              },
                              child: Text(
                                'Forgot Your Password?',
                                style: TextStyle(
                                    color: Color(0xff636363), fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          CustomeElevatedbutton(
                            text: 'Log In',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                try {
                                  await _authService.signIn(
                                      _email!, _password!);
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeView()));
                                } on FirebaseAuthException catch (e) {
                                  setState(() {
                                    _errorMessage = e.message;
                                  });
                                }
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?',
                                  style: Styles.textStyle16),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpView()));
                                },
                                child:
                                    Text('Sign Up', style: Styles.textStyle18),
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
    );
  }
}
