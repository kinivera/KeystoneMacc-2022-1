import 'package:flutter/material.dart';
import 'package:responsivedashboard/utils/constants.dart';

import 'package:responsivedashboard/Maticas/ui/widgets/about_text.dart';
import 'package:responsivedashboard/Maticas/ui/widgets/about_screen_top_image.dart';

class AboutScreenMobile extends StatefulWidget {
  const AboutScreenMobile({Key? key}) : super(key: key);

  @override
  State<AboutScreenMobile> createState() => _AboutScreenMobileState();
}

class _AboutScreenMobileState extends State<AboutScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AboutTopImage(),
        SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: AboutText(),
            )),
        SizedBox(
          height: defaultPadding,
        )
      ],
    );
  }
}
