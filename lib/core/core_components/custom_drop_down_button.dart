import 'package:babi_dealz_app/core/core_components/custom_text.dart';
import 'package:babi_dealz_app/core/utils/app_assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_theme/app_theme.dart';

class CustomDropdownButton extends StatefulWidget {
  final String? selectedOption;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final bool? changeBorderColor;
  final String text;
  final bool isSelectedType;

   CustomDropdownButton({
    super.key,
    required this.selectedOption,
    required this.options,
    required this.onChanged,
    required this.text,
    this.changeBorderColor,
    this.isSelectedType=false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        border:Border.all(color:widget.changeBorderColor==true?AppTheme.lightGrayColor: AppTheme.whiteColor),
        borderRadius: BorderRadius.circular(9.w),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: CircleAvatar(
            backgroundColor: AppTheme.yellowColor,
            radius: 12.h,
            child: Image.asset(
              AppAssets.arrowDownAsset,
              height: 15.h,
              width: 15.w,
            ),
          ),
          borderRadius: BorderRadius.circular(18.w),
          style:TextStyle(color:widget.isSelectedType==true?AppTheme.subTitleColor:AppTheme.whiteColor),
          dropdownColor: AppTheme.darkColor,
          value: widget.selectedOption,
          hint: CustomTextWidget(
            text: widget.text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color:widget.isSelectedType==true?AppTheme.subTitleColor:AppTheme.whiteColor,
            ),
          ),
          isExpanded: true,
          onChanged: widget.onChanged,
          items: widget.options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: CustomTextWidget(
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                text: option,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
