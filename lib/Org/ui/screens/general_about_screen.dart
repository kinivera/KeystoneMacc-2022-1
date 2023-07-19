import 'package:flutter/material.dart';

import 'package:responsivedashboard/utils/widgets/background.dart';
import 'package:responsivedashboard/utils/responsive_layout.dart';

import 'package:responsivedashboard/Org/ui/screens/desktop/general_about_screen_desktop.dart';
import 'package:responsivedashboard/Org/ui/screens/mobile/general_about_screen_mobile.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: ResponsiveLayout(
          mobileBody: AboutScreenMobile(),
          desktopBody: AboutScreenDesktop(),
        ),
      ),
    );
  }
}
