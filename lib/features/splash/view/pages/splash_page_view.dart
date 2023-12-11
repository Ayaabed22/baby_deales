import 'package:flutter/material.dart';
import '../../../../core/utils/app_theme/app_theme.dart';
import '../widgets/splash_body_page_view.dart';

class SplashViewPage extends StatelessWidget {
  const SplashViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.darkColor,
        body: SplashBodyPageView(),
      ),
    );
  }
}
