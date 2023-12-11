import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/register_body_page_view.dart';

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: RegisterBodyPageView(),
    );
  }
}
