import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';
import '../../General_About/general_about.dart';


class LoginAndSignupBtn extends StatefulWidget {
  const LoginAndSignupBtn({Key? key}) : super(key: key);

  @override
  State<LoginAndSignupBtn> createState() => _LoginAndSignupBtnState();
}

class _LoginAndSignupBtnState extends State<LoginAndSignupBtn > {
  

  @override
  Widget build(BuildContext context) {
    print("Estás en los botones del homescreen");
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            child: const Text(
              "L O G I N",
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryLightColor, elevation: 0),
          child: const Text(
            "S I G N  U P",
            style:  TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AboutScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff6ae792), elevation: 0),
          child: const Text(
            "A B O U T",
            style:  TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
