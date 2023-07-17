import 'package:flutter/material.dart';

import 'package:responsivedashboard/CommonWidgets/background.dart';
import 'package:responsivedashboard/utils/responsive_layout.dart';

import 'package:responsivedashboard/User/ui/screens/desktop/welcome_screen_desktop.dart';
import 'package:responsivedashboard/User/ui/screens/mobile/welcome_screen_mobile.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: ResponsiveLayout(
          mobileBody: WelcomeScreenMobile(),
          desktopBody: WelcomeScreenDesktop(),
        ),
      ),
    );
  }
}
