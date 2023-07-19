import 'package:flutter/material.dart';

import 'package:responsivedashboard/utils/widgets/welcome_image.dart';
import 'package:responsivedashboard/User/ui/widgets/login_signup_btn.dart';
import 'package:responsivedashboard/utils/constants.dart';

class WelcomeScreenMobile extends StatefulWidget {
  const WelcomeScreenMobile({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenMobile> createState() => _WelcomeScreenMobileState();
}

class _WelcomeScreenMobileState extends State<WelcomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          WelcomeImage(),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: LoginAndSignupBtn(),
            ),
          ),
          SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
