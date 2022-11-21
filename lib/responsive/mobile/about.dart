import 'package:flutter/material.dart';
import 'package:responsivedashboard/Welcome/components/welcome_image.dart';
import '../../constants.dart';
import '../../util/Menu.dart';


class AboutMobile extends StatefulWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: topBar,
      drawer: Menu(),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: const <Widget>[
                WelcomeImage(),
                Center(
                  child: Text('''Sistema aplicacion-sensor, que permite conectar la informacion que proviene de los sensores
                 Escuela de Ingeniería, Ciencia y Tecnología - Universidad del Rosario
                                 '''),
                )
              ],
            ),
          ),
        ),
      
    );
  }
}
