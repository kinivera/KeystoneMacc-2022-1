import 'package:flutter/material.dart';
import '../constants.dart';
import '../../states/indicatorStates.dart';

import 'package:flutter/material.dart';

const List<String> list = <String>['Minutes','Hours', 'Days','Actual-Week', 'Months', 'Years'];


class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      underline: Container(
        height: 2,
        color:const Color.fromARGB(255, 0, 0, 0),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value), 
        );
      }).toList(),
    );
  }
}
