// ignore: file_names
import 'package:flutter/material.dart';
import '../constants.dart';
import '../util/Button.dart';

class GridButtons extends StatelessWidget {
  final String mode;
  const GridButtons({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 80,
  mainAxisSpacing: mode == desktopMode ? 80 : 20,
  crossAxisCount: mode == desktopMode ? 4 : 2,
  children: <Widget>[
    Button(mode: mode, fn: (){debugPrint('Diste click en presion');}, img: "/images/presion.png" ),
    Button(mode: mode, fn: (){debugPrint('Diste click en temperatura');}, img: "/images/temperatura.png" ),
    Button(mode: mode, fn: (){debugPrint('Diste click en bateria');}, img: "/images/poder.png" ),
    Button(mode: mode, fn: (){debugPrint('Diste click en humedad');}, img: "/images/humedad.png" ),
    Button(mode: mode, fn: (){debugPrint('Diste click en bombillo');}, img:"/images/idea-fresca.png" ),
    Button(mode: mode, fn: (){debugPrint('Diste click en voltaje');}, img: "/images/voltaje.png" ),
    Button(mode: mode, fn: (){debugPrint('Diste click en mas');}, img: "/images/mas.png" )
  ],
);
  }
}
