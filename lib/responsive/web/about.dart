// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Signup/components/sign_up_top_image.dart';
import '../../constants.dart';
import '../../util/Menu.dart';

class AboutDesktop extends StatefulWidget {
  const AboutDesktop({Key? key}) : super(key: key);

  @override
  State<AboutDesktop> createState() => _AboutDesktopState();
}

class _AboutDesktopState extends State<AboutDesktop> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: topBar,
      drawer: const Menu(),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: const <Widget>[
                const SignUpScreenTopImage(),
                Center(
                  child: Text('''Sistema aplicacion-sensor, que permite conectar la informacion que proviene de los sensores
                 Escuela de Ingeniería, Ciencia y Tecnología - Universidad del Rosario
                                 '''),

                ),
              ],
            ),
          ),
        ),
      
    );
  }
}

