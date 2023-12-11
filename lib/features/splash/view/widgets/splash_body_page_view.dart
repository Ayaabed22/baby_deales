import 'package:babi_dealz_app/core/app_routes/routes/app_routes.dart';
import 'package:babi_dealz_app/core/utils/app_assets/app_assets.dart';
import 'package:babi_dealz_app/core/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core_components/custom_button.dart';
import '../../../../core/core_components/custom_drop_down_button.dart';

class SplashBodyPageView extends StatefulWidget {
  const SplashBodyPageView({Key? key}) : super(key: key);

  @override
  State<SplashBodyPageView> createState() => _SplashBodyPageViewState();
}

class _SplashBodyPageViewState extends State<SplashBodyPageView> {
  String? selectedOption;
  List<String> options = [
    AppString.englishString,
    AppString.arabicString,
    AppString.frenchString
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.splashAsset,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 450.h,
              ),
              CustomDropdownButton(
                selectedOption: selectedOption,
                options: options,
                isSelectedType: false,
                onChanged: (newValue) {
                  setState(
                    () {
                      selectedOption = newValue;
                    },
                  );
                },
                text: AppString.languageString,
              ),
              SizedBox(
                height: 26.w,
              ),
              CustomButton(
                text: AppString.nextString,
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.onBoardingViewPageRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
