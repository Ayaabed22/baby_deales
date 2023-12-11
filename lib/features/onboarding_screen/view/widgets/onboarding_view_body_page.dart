import 'package:babi_dealz_app/core/styles/text_styles.dart';
import 'package:babi_dealz_app/features/onboarding_screen/view/widgets/page1.dart';
import 'package:babi_dealz_app/features/onboarding_screen/view/widgets/page2.dart';
import 'package:babi_dealz_app/features/onboarding_screen/view/widgets/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../constant/constant.dart';
import '../../../../core/app_routes/routes/app_routes.dart';
 import '../../../../core/core_components/custom_text_button.dart';
import '../../../../core/utils/app_strings/app_strings.dart';
import '../../../../core/utils/app_theme/app_theme.dart';

class OnBoardingViewPageBody extends StatefulWidget {
  const OnBoardingViewPageBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewPageBody> createState() => _OnBoardingViewPageState();
}

class _OnBoardingViewPageState extends State<OnBoardingViewPageBody> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 18.h),
              child: Stack(
                children: [
                  PageView(
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    children: const [
                      PageOne(),
                      PageTwo(),
                      PageThree(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// skip
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomTextButton(
                          text: AppString.skipString,
                          style: Styles.sitkaBoldText20.copyWith(
                            color: AppTheme.titleGrayColor,
                          ),
                          onPressed: () {
                            if (currentIndex == 2) {
                              GoRouter.of(context).pushReplacementNamed(
                                  AppRoutes.loginViewRoute);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 65.w,
                      ),

                      /// smooth indicator
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          alignment: const Alignment(1, 1),
                          child: SmoothPageIndicator(
                            onDotClicked: (index) {},
                            effect: JumpingDotEffect(
                              dotHeight: 12.h,
                              dotWidth: 12.w,
                              spacing: 8,
                              dotColor: AppTheme.whiteColor,
                              activeDotColor: AppTheme.yellowColor,
                              jumpScale: 1.6,
                            ),
                            controller: controller,
                            count: 3,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70.w,
                      ),

                      /// login & icon
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            if (currentIndex == 2) {
                              GoRouter.of(context).pushReplacementNamed(
                                  AppRoutes.loginViewRoute);
                            } else {
                              controller.nextPage(
                                  duration: durationMilliseconds,
                                  curve: Curves.linearToEaseOut);
                            }
                          },
                          child: currentIndex != 2
                              ? CircleAvatar(
                                  radius: 20.h,
                                  backgroundColor: AppTheme.yellowColor,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 19.h,
                                    ),
                                  ),
                                )
                              : CustomTextButton(
                                  text: AppString.loginString,
                                  style: Styles.sitkaBoldText20.copyWith(
                                    color: AppTheme.darkColor,
                                  ),
                                  onPressed: () {
                                    if (currentIndex == 2) {
                                      GoRouter.of(context).push(
                                         AppRoutes.loginViewRoute,
                                      );
                                    }
                                  },
                                ),
                        ),
                      ),
                    ],
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
