import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/app_theme/app_theme.dart';

class CustomPin extends StatelessWidget {
  const CustomPin({
    Key? key,
    required this.onCompleted
  }) : super(key: key);
  final Function onCompleted;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      cursorColor: AppTheme.lightGrayColor,
      keyboardType: TextInputType.number,
      blinkWhenObscuring: true,
      textStyle: TextStyle(
          color: AppTheme.whiteColor,
          fontSize: 20.sp),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      pinTheme: PinTheme(
        inactiveColor: AppTheme.lightGrayColor,
        inactiveFillColor: AppTheme.lightGrayColor,
        shape: PinCodeFieldShape.circle,
        fieldWidth:60.0,
        //fieldOuterPadding:EdgeInsetsDirectional.symmetric(horizontal:.01),
        activeFillColor: AppTheme.yellowColor,
        selectedFillColor: AppTheme.subTitleColor,
        activeColor: Colors.white,

      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      animationType: AnimationType.fade,
      onCompleted: (v) {
        onCompleted(v);
      },

      onChanged: (value) {
        if (kDebugMode) {
          print(value);
        }
        // setState(() {
        //   currentText = value;
        // });
      },

      beforeTextPaste: (text) {
        if (kDebugMode) {
          print("Allowing to paste $text");
        }
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      }, appContext: context,
    );
  }
}