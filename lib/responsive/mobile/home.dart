import 'package:flutter/material.dart';
import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/util/gridButtons.dart';
import '../../states/indicatorStates.dart';
import '../../util/Menu.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverPadding(
            padding: EdgeInsets.all(20),
            sliver:GridButtons(mode: mobileMode)
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
                    child: Text('Mobile List Item ${dashboardState.actual[index]}'),
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
