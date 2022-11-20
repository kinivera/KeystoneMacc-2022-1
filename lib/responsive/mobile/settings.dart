import 'package:flutter/material.dart';
import 'package:responsivedashboard/constants.dart';
import '../../states/indicatorStates.dart';
import '../../util/Dropdown.dart';
import '../../util/Menu.dart';
import 'package:states_rebuilder/states_rebuilder.dart';


class SettingsMobile extends StatefulWidget {
  const SettingsMobile({Key? key}) : super(key: key);

  @override
  State<SettingsMobile> createState() => _SettingsMobileState();
}

class _SettingsMobileState extends State<SettingsMobile> {
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

