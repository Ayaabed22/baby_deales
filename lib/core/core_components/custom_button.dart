import 'package:babi_dealz_app/core/core_components/custom_text.dart';
import 'package:babi_dealz_app/core/utils/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final bool isHeight,textSize;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.isHeight=true,
    this.textSize=true,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: 300.0,
        height:widget.isHeight?45.h:60.h,
        decoration: BoxDecoration(
          color: AppTheme.yellowColor,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Center(
          child: CustomTextWidget(
            style: TextStyle(
              color: AppTheme.darkColor, // Text color #221E1D
              fontSize:widget.textSize?25.sp:13.sp,
              fontWeight:widget.textSize?FontWeight.w600:FontWeight.w900,
              fontFamily: "Urbanist"
            ),
            text: widget.text,
          ),
        ),
      ),
    );
  }
}
