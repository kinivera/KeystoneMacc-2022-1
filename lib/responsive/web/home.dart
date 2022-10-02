import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import '../../constants.dart';
import '../../util/Menu.dart';
import '../../util/gridButtons.dart';
import '../../states/indicatorStates.dart';

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
      drawer: const Menu(),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverPadding(
            padding: EdgeInsets.all(20),
            sliver:GridButtons(mode: desktopMode)
          ),
          dashboard.rebuild(
            () => SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    height: 400,
                    width: 10,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('List Item ${dashboardState.actual[index]}'),
                  );
                },
                childCount: dashboardState.actual.length,
              ),
            )
          ),
        ], 
      ),
    );
  }
}
