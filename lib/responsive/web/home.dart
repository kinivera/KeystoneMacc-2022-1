import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../util/gridButtons.dart';

class HomeMenuDesktop extends StatefulWidget {
  const HomeMenuDesktop({Key? key}) : super(key: key);

  @override
  State<HomeMenuDesktop> createState() => _HomeMenuDesktopState();
}

class _HomeMenuDesktopState extends State<HomeMenuDesktop> {
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
