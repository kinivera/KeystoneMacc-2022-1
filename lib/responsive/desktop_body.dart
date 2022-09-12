import 'package:flutter/material.dart';
import '../constants.dart';
import '../util/gridButtons.dart';
import '../util/my_tile.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: topBar,
      drawer: menu,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // first half of page
            Expanded(
              flex: 2,
              child: GridButtons(mode: desktopMode),
            ),
          ],
        ),
      ),
    );
  }
}
