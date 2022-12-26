import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../util/Dropdown.dart';
import '../../util/Menu.dart';

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
