// ignore: file_names
import 'package:flutter/material.dart';
import '../constants.dart';

class Button extends StatelessWidget {
  final String mode;
  final String img;
  final Function fn;
  const Button({super.key, required this.mode, required this.fn, required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){fn();},
      child: Container(
        padding: const EdgeInsets.all(paddingBackgroundImages),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mode == desktopMode ? 60.0 : 360.0),
          color: defaultBackgroundColorSecondary
        ),
        child: Image.asset(img),
      )
    );
  }
}
