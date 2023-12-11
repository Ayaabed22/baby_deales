import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/core_components/custom_text.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/app_assets/app_assets.dart';
import '../../../../core/utils/app_strings/app_strings.dart';
import '../../../../core/utils/app_theme/app_theme.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        /// Yellow background photo
        Positioned(
          top: -20.h,
          left: -80.h,
          right: -70.h,
          child: AspectRatio(
            aspectRatio: screenWidth / 320,
            child: SvgPicture.asset(
              AppAssets.yellowBackground1Asset,
            ),
          ),
        ),

        /// BackGround Home photo
        Positioned(
          top: -35.h,
          left: -60.h,
          right: -45.h,
          child: AspectRatio(
            aspectRatio: screenWidth / 350,
            child: Image.asset(
              AppAssets.home1Asset,
              fit: BoxFit.cover,
            ),
          ),
        ),
        /// home
        Positioned(
          top: 50.h,
          left: 48.h,
          child: SvgPicture.asset(
            AppAssets.homeOnBoardingPage1Asset,
          ),
        ),
        /// Content
        Positioned.fill(
          top: 360.h,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: AppString.findHomeString,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.sitkaBoldText33.copyWith(
                        color: AppTheme.darkColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextWidget(
                      text: AppString.loremString,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.swisLightText15.copyWith(
                        color: AppTheme.subTitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
