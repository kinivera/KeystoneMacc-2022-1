import 'package:flutter/material.dart';
import 'package:responsivedashboard/utils/constants.dart';

import 'package:responsivedashboard/CommonWidgets/welcome_image.dart';
import 'package:responsivedashboard/User/ui/widgets/login_signup_btn.dart';

class WelcomeScreenDesktop extends StatefulWidget {
  const WelcomeScreenDesktop({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenDesktop> createState() => _WelcomeScreenDesktopState();
}

class _WelcomeScreenDesktopState extends State<WelcomeScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: WelcomeImage(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 450,
                  child: LoginAndSignupBtn(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
        ],
      ),
    );
  }
}
