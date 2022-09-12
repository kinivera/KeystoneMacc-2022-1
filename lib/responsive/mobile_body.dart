import 'package:flutter/material.dart';
import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/util/gridButtons.dart';
import 'package:responsivedashboard/util/my_tile.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: topBar,
      drawer: menu,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Expanded(
              flex: 2,
              child: GridButtons(mode: mobileMode),
            ),
          ],
        ),
      ),
    );
  }
}
