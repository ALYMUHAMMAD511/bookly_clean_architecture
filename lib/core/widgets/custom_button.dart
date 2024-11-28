import 'package:bookly_ebook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.borderRadius,
    this.fontSize,
    this.onPressed,
    this.fontFamily,
  });

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final String? fontFamily;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ),
        child: Text(
              text,
              style: Styles.textStyle18.copyWith(
                fontFamily: fontFamily,
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
