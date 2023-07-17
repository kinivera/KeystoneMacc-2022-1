import 'package:flutter/material.dart';

import 'package:responsivedashboard/utils/constants.dart';

import 'package:responsivedashboard/User/ui/widgets/login_form.dart';
import 'package:responsivedashboard/User/ui/widgets/login_screen_top_image.dart';

class LoginScreenDesktop extends StatelessWidget {
  const LoginScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: LoginScreenTopImage(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 450,
                  child: LoginForm(),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: defaultPadding,
        )
      ],
    );
  }
}
