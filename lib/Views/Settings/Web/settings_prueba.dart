import 'package:flutter/material.dart';

import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/Widgets/menu.dart';
import 'package:responsivedashboard/Widgets/dropdown.dart';

class SettingsDesktop2 extends StatefulWidget {
  const SettingsDesktop2({Key? key}) : super(key: key);

  @override
  State<SettingsDesktop2> createState() => _SettingsDesktop2State();
}

class _SettingsDesktop2State extends State<SettingsDesktop2> {
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
              children: <Widget>[
                Text('Select the frecuency you want the data to be displayed'),
                Text(''),
                DropdownButtonExample(),
                Text('---prueba---'),
                Text('------------'),
                ElevatedButton(
                      style:   ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
                        
                      ),
                      onPressed: () => {print("ola")},
                      child: Text('ADD PERSON'),
                ),
                Text('------------'),
                ElevatedButton(
                      style:   ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
                      ),
                      onPressed: () => {print("adios")},
                      child: Text('REMINDERS'),
                ),

              ],
            ),
          ),
        ),
      
    );
  }
}
