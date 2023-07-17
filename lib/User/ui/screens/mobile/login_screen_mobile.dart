import 'package:flutter/material.dart';

import 'package:responsivedashboard/utils/constants.dart';

import 'package:responsivedashboard/User/ui/widgets/login_form.dart';
import 'package:responsivedashboard/User/ui/widgets/login_screen_top_image.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LoginScreenTopImage(),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: LoginForm(),
          ),
        ),
        SizedBox(
          height: defaultPadding,
        )
      ],
    );
  }
}
