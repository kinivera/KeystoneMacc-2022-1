import 'package:flutter/material.dart';

import 'package:responsivedashboard/Maticas/ui/widgets/about_text.dart';
import 'package:responsivedashboard/Maticas/ui/widgets/about_screen_top_image.dart';
import 'package:responsivedashboard/utils/constants.dart';

class AboutScreenDesktop extends StatefulWidget {
  const AboutScreenDesktop({Key? key}) : super(key: key);

  @override
  State<AboutScreenDesktop> createState() => _AboutScreenDesktopState();
}

class _AboutScreenDesktopState extends State<AboutScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: AboutTopImage(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: AboutText(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: defaultPadding,
        )
      ],
    );
  }
}
