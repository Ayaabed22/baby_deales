import 'package:babi_dealz_app/core/core_components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? textDecoration;
  final TextStyle? style;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.maxLines,
    this.overflow,
    this.color,
    this.textAlign,
    this.textScaleFactor,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomTextWidget(
        text: text,
        style: style,
      ),
    );
  }
}
