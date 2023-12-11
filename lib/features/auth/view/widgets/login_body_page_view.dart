import 'package:babi_dealz_app/core/core_components/validator.dart';
import 'package:babi_dealz_app/core/utils/app_assets/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_routes/routes/app_routes.dart';
import '../../../../core/core_components/custom_button.dart';
import '../../../../core/core_components/custom_text.dart';
import '../../../../core/core_components/custom_text_form_field.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/app_strings/app_strings.dart';
import '../../../../core/utils/app_theme/app_theme.dart';
import '../../viewmodel/bloc/auth-cubit/auth-cubit.dart';
import '../../viewmodel/bloc/auth-cubit/auth-state.dart';

class LoginBodyPageView extends StatelessWidget {
  LoginBodyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> loginKey = GlobalKey<FormState>();
    return SafeArea(
        child: SingleChildScrollView(
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
                  text: AppString.loginString,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.urbanistTextStyle24.copyWith(
                    color: AppTheme.darkColor,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextWidget(
                  text: AppString.loginDescription,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.swisLightText14.copyWith(
                    color: AppTheme.subTitleColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Form(
          key:loginKey,
          child: Column(
            children: [
            CustomFormField(
            hintText: AppString.phoneString,
            keyboardType: TextInputType.phone,
            controller: phoneController,
            validator: phoneValidator,
          ),
          SizedBox(
            height: 12.h,
          ),
          CustomFormField(
            hintText: AppString.passwordString,
            keyboardType: TextInputType.number,
            controller: passwordController,
            validator: passwordValidator,
          ),
          SizedBox(
            height: 12.h,
          ),
          BlocConsumer<AuthCubit, AuthState>(
          listener:(context, state)
              {
                if (state is SignInSuccessfulState) {
                print("login Sucess");
                GoRouter.of(context).push(AppRoutes.otpViewRoute);
                }
                else if (state is SignInErrorState) {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: AppTheme.darkColor,
          ));
                }
              },
              buildWhen: (pre, current) {
              if (current is SignInLoadingState) {
              return true;
              } else if (current is SignInSuccessfulState) {
              return true;
              } else if (current is SignInErrorState) {
              return true;
              } else {
              return false;
              }
              },
              builder: (context,state) {
                return (state is SignInLoadingState)
            ? const Center(
            child:
            CircularProgressIndicator.adaptive())
            : CustomButton(
          text: AppString.loginString,
          isHeight: false,
          onPressed: () {
            if (loginKey.currentState!.validate())
            {
              AuthCubit.get(context).signIn(
                  phone: phoneController.text,
                  password: passwordController.text);
            }
            // GoRouter.of(context).push(AppRoutes.registerRoute);

          },
          textSize: false,
                );
              }
              ),
              ],
              ),
        ),
    SizedBox(
    height: 21.h,
    ),
    Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth*.09),
    child: Row(children: [
    CustomTextWidget(
    text: AppString.accountString,
    textAlign: TextAlign.right,
    overflow: TextOverflow.ellipsis,
    style: Styles.swisLightText14.copyWith(
    color: AppTheme.subTitleColor,
    ),
    ),
    SizedBox(width: 50.r,),
    CustomTextWidget(
    text: AppString.registerString,
    overflow: TextOverflow.ellipsis,
    style: Styles.swisLightText14.copyWith(
    color:AppTheme.darkColor,
    decoration: TextDecoration.underline
    ),
    ),

    ]),
    ),
    SizedBox(
    height: 29.h,
    ),
    Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth*.09),
    child: Row(children: [
    Container(
    color: AppTheme.darkColor,
    width: 80.r,
    height: 1.h,
    ),
    SizedBox(width: 11.r,),
    CustomTextWidget(
    text: AppString.loginApps,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: Styles.swisLightText14.copyWith(
    color: AppTheme.darkColor,
    ),
    ),
    SizedBox(width: 11.r,),
    Container(
    color: AppTheme.darkColor,
    width: 80.r,
    height: 1.h,
    ),

    ]),
    ),
    SizedBox(
    height: 31.h,
    ),
    Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth*.30),
    child: Row(children: [
    Image.asset(AppAssets.googleLogin,height: 22.h,width:22.r,color: AppTheme.yellowColor,),
    SizedBox(width: 33.r,),
    Image.asset(AppAssets.facebookLogin,height: 22.h,width:22.r,),
    SizedBox(width: 33.r,),
    Image.asset(AppAssets.twitterLogin,height: 22.h,width:22.r,color: AppTheme.yellowColor,),

    ]),
    ),
    SizedBox(
    height: 10.h,
    ),


    ],
    ),
    ),
    );
    }
  }
