import 'package:flutter/material.dart';

import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/Widgets/menu.dart';
import 'package:responsivedashboard/Widgets/dropdown.dart';

class SettingsDesktop extends StatefulWidget {
  const SettingsDesktop({Key? key}) : super(key: key);

  @override
  State<SettingsDesktop> createState() => _SettingsDesktopState();
}

class _SettingsDesktopState extends State<SettingsDesktop> {
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
                Text('Select the frecuency you want the data to be displayed'),
                Text(''),
                DropdownButtonExample()
              ],
            ),
          ),
        ),
      
    );
  }
}
