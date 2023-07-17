import 'package:flutter/material.dart';

import 'package:responsivedashboard/utils/responsive_layout.dart';
import 'package:responsivedashboard/CommonWidgets/background.dart';

import 'package:responsivedashboard/User/ui/screens/mobile/login_screen_mobile.dart';
import 'package:responsivedashboard/User/ui/screens/desktop/login_screen_desktop.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: ResponsiveLayout(
          mobileBody: LoginScreenMobile(),
          desktopBody: LoginScreenDesktop(),
        ),
      ),
    );
  }
}
