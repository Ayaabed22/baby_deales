import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/core_components/custom_text.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/app_assets/app_assets.dart';
import '../../../../core/utils/app_strings/app_strings.dart';
import '../../../../core/utils/app_theme/app_theme.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        /// Yellow background photo
        Positioned(
          top: -60.h,
          left: -40.h,
         right: -105.h,
          child: AspectRatio(
            aspectRatio: screenWidth / 350,
            child: SvgPicture.asset(
              AppAssets.yellowBackground3Asset,
            ),
          ),
        ),

        /// BackGround Home photo
        Positioned(
          top: -65.h,
          left: -100.h,
          right: -45.h,
          child: AspectRatio(
            aspectRatio: screenWidth / 300,
            child: Image.asset(
              AppAssets.home3Asset,
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// home
        Positioned(
          top: 45.h,
          right: 10.h,
          child: SvgPicture.asset(
            AppAssets.homeRate3Asset,
          ),
        ),

        /// Content
        Positioned.fill(
          top: 350.h,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    text: AppString.sellString,
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
      ],
    );
  }
}
