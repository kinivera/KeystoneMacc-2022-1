import 'package:flutter/material.dart';
import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/util/gridButtons.dart';

import '../../util/Menu.dart';

class HomeMenuMobile extends StatefulWidget {
  const HomeMenuMobile({Key? key}) : super(key: key);

  @override
  State<HomeMenuMobile> createState() => _HomeMenuMobileState();
}

class _HomeMenuMobileState extends State<HomeMenuMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: topBar,
      drawer: const Menu(),
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
