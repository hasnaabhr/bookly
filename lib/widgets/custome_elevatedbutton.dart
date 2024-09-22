import 'package:bookly/widgets/styles.dart';
import 'package:flutter/material.dart';

class CustomeElevatedbutton extends StatelessWidget {
  const CustomeElevatedbutton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFD5AC),
          foregroundColor: const Color(0xFFFFD5AC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text,
            style: Styles.textStyle20
                .copyWith(color: Colors.black, fontWeight: FontWeight.w900)),
      ),
    );
  }
}
