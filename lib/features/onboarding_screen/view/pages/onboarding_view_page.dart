import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme/app_theme.dart';
import '../widgets/onboarding_view_body_page.dart';

class OnBoardingViewPage extends StatelessWidget {
  const OnBoardingViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: OnBoardingViewPageBody(),
      ),
    );
  }
}
