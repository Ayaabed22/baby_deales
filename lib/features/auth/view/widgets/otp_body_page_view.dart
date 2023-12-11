import 'dart:async';

import 'package:babi_dealz_app/constant/constant.dart';
import 'package:babi_dealz_app/core/core_components/custom_button.dart';
import 'package:babi_dealz_app/features/auth/viewmodel/bloc/auth-cubit/auth-cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core_components/custom-pin.dart';
import '../../../../core/core_components/custom_text.dart';
import '../../../../core/helpers/database/local/cach_helper.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/app_assets/app_assets.dart';
import '../../../../core/utils/app_strings/app_strings.dart';
import '../../../../core/utils/app_theme/app_theme.dart';

class OTPBodyPageView extends StatefulWidget {
  const OTPBodyPageView({super.key});

  @override
  State<OTPBodyPageView> createState() => _OTPBodyPageViewState();
}

class _OTPBodyPageViewState extends State<OTPBodyPageView> {
  int resendTime=20;
  late Timer countDownTimer;

  @override
  void initState() {
    stopTime();
    // TODO: implement initState
    super.initState();
  }
   startTimer() {
    countDownTimer =Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
       resendTime =resendTime-1;
      });
      if(resendTime<1){
        countDownTimer.cancel();
      }
    });
   }
   stopTime(){
    if(countDownTimer.isActive){
      countDownTimer.cancel();
    }
   }
   String strFormatting(n) => n.toString().padLeft(2,'0');

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: screenWidth / 360,
                  child: Image.asset(AppAssets.loginAsset, fit: BoxFit.fill),
                ),
                Positioned(
                    top: 30.h,
                    right: 30.h,
                    left: 30.h,
                    child: Image.asset(
                      AppAssets.logoAsset,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: AppString.otpString,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.urbanistTextStyle24.copyWith(
                        color: AppTheme.darkColor,
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    CustomTextWidget(
                      text: AppString.otpDesString,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.swisLightText10.copyWith(
                        color: AppTheme.subTitleColor,
                      ),
                    ),
                    CustomTextWidget(text:phone,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.swisLightText10.copyWith(
                        color: AppTheme.orangeColor,
                      ),),

                    SizedBox(height: 15.h),
                    CustomPin(onCompleted: (v) {
                     // AuthCubit.get(context).sendOtpVerifyPhone(v);
                      // Navigator.pushNamed(context, Routes.welcomePage);
                    }),
                    SizedBox(height: 10.h),
                    resendTime!=0?
                    Text('you can recive otp after${strFormatting(resendTime)}second(s)',
                      style: TextStyle(fontSize: 18),)
                    :InkWell(
                      onTap: (){
                        startTimer();
                        resendTime=20;
                        //AuthCubit.get(context).reSendOtpVerifyPhone(AuthCubit.get(context).phonee!);
                      },
                      child: RichText(text:TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children:<TextSpan> [
                            TextSpan(text:AppString.notReceiveString,style: Styles.swisLightText14.copyWith(
                              color: AppTheme.subTitleColor,
                            ),),
                            TextSpan(text: AppString.resendCodeString,style: Styles.swisLightText14.copyWith(
                              color:Colors.red,
                            ),)

                          ]
                      )),
                    )
                 ,

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            CustomButton(textSize:false,text: AppString.verifyNow, onPressed: (){
              stopTime();
            },)
          ],
        ),
      ),
    );
  }


}

