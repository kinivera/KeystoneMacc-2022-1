import 'package:flutter/material.dart';

import 'package:responsivedashboard/utils/constants.dart';
import 'package:responsivedashboard/utils/widgets/background.dart';

import 'package:responsivedashboard/User/ui/widgets/signup_form.dart';
import 'package:responsivedashboard/User/ui/widgets/sign_up_top_image.dart';

class SignUpScreenMobile extends StatelessWidget {
  const SignUpScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SignUpScreenTopImage(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: SignUpForm(),
              ),
            ),
            SizedBox(height: defaultPadding),
          ],
        ),
      ],
    );
  }
}
