import 'package:flutter/material.dart';

import 'package:responsivedashboard/CommonWidgets/background.dart';
import 'package:responsivedashboard/utils/responsive_layout.dart';

import 'package:responsivedashboard/User/ui/screens/desktop/signup_screen_desktop.dart';
import 'package:responsivedashboard/User/ui/screens/mobile/signup_screen_mobile.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
          child: ResponsiveLayout(
              mobileBody: SignUpScreenMobile(),
              desktopBody: SignUpScreenDesktop())),
    );
  }
}
