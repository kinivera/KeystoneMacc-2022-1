import 'package:flutter/material.dart';
import '../constants.dart';

class ButtonMenu extends StatelessWidget {
  final String texto ;
  final IconData icono ;
  final Function answer;
  const ButtonMenu({super.key, required this.icono, required this.texto, required this.answer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(icono , color:menuColorText),
          title: Text(
            texto,
            style: drawerTextColor,
          ),
        ),
      ),
      onTap: (){answer();},
    );
  }
}
