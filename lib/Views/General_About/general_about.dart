import 'package:flutter/material.dart';

import 'package:responsivedashboard/Views/responsive.dart';
import 'package:responsivedashboard/Widgets/background.dart';

import 'components/about_text.dart';
import 'components/about_screen_top_image.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {


  @override
  Widget build(BuildContext context) {
    print("loading testview file");
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const AboutTopImage(),
          desktop: Row(
            children: [
              const Expanded(
                child: AboutTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: AboutText(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileTestScreen extends StatelessWidget {
  const MobileTestScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const AboutTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: AboutText(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
