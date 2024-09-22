import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {super.key,
      required this.labelName,
      required this.hintText,
      required this.obscureText,
      this.validator, this.controller, this.onSaved});
  final String labelName, hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      onSaved: onSaved,
      style: const TextStyle(color: Colors.white),
      validator: validator,
      obscureText: obscureText,
      cursorColor: const Color.fromARGB(255, 239, 249, 255),
      decoration: InputDecoration(
          label: Text(
            labelName,
            style: const TextStyle(color: Color(0xff636363)),
          ),
          hintText: hintText,
          
          filled: true,
          fillColor: const Color(0xff111111),
          hintStyle: const TextStyle(
            color: Color(0xff636363),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff232323),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff232323),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff636363),
            ),
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
