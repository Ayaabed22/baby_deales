import 'package:flutter/material.dart';

import '../widgets/login_body_page_view.dart';

class LoginViewPage extends StatelessWidget {
  const LoginViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoginBodyPageView(),
    );
  }
}
