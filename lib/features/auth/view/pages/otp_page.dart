import 'package:babi_dealz_app/core/utils/app_theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/otp_body_page_view.dart';

class OtpViewPage extends StatelessWidget {
  const OtpViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: OTPBodyPageView(
      ),
    );
  }
}
