import 'package:flutter/material.dart';

class MyPopupMenuButton extends StatefulWidget {
  @override
  _MyPopupMenuButtonState createState() => _MyPopupMenuButtonState();
}

class _MyPopupMenuButtonState extends State<MyPopupMenuButton> {
  String _selectedOption;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        setState(() {
          _selectedOption = value;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: 'Option 1',
          child: Text('Option 1'),
        ),
        PopupMenuItem(
          value: 'Option 2',
          child: Text('Option 2'),
        ),
        PopupMenuItem(
          value: 'Option 3',
          child: Text('Option 3'),
        ),
      ],
      child: ElevatedButton(
        child: Text('Mostrar opciones'),
        onPressed: () {},
      ),
    );
  }
}
