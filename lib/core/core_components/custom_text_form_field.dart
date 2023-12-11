import 'package:babi_dealz_app/core/utils/app_assets/app_assets.dart';
import 'package:babi_dealz_app/core/utils/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/text_styles.dart';
class CustomFormField extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? hasIcon;
  bool? enable;
   CustomFormField({
    super.key,
   this.hintText,
    this.hasIcon,
   this.keyboardType,
    this.controller,
    this.validator,
    this.enable

  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:widget.hasIcon==true?225: 300.0,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        textInputAction: TextInputAction.next,
        controller: widget.controller,
        enabled:widget.enable==true?false:true,
        style: Styles.swisLightText15.copyWith(
            height: 1.1.h,
            fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          errorStyle: Styles.swisLightText15,
          fillColor:Colors.white,
          filled: true,
          hintStyle: Styles.swisLightText15.copyWith(
              color:AppTheme.subTitleColor,
              fontWeight: FontWeight.normal,
          ),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0.r),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16.0.r),
            ),
          ),
        ),
      ),
    );
  }
}