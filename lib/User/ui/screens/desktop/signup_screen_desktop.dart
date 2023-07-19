import 'package:flutter/material.dart';

import 'package:responsivedashboard/utils/constants.dart';
import 'package:responsivedashboard/utils/widgets/background.dart';

import 'package:responsivedashboard/User/ui/widgets/signup_form.dart';
import 'package:responsivedashboard/User/ui/widgets/sign_up_top_image.dart';

class SignUpScreenDesktop extends StatelessWidget {
  const SignUpScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SignUpScreenTopImage(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 450,
                  child: SignUpForm(),
                ),
                SizedBox(height: defaultPadding),
                // SocalSignUp()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
