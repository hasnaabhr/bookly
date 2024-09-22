import 'package:bookly/widgets/styles.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton(
      {super.key,
      required this.backgroundcolor,
      required this.textColor,
      this.borderRadius,
      required this.text, this.onPressed});
  final Color backgroundcolor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final void Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle18
              .copyWith(color: textColor, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
