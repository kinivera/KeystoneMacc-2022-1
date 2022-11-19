import 'package:flutter/material.dart';
import 'package:responsivedashboard/util/indicatorChart.dart';
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
                  print(dashboardState.trans[dashboardState.actual[index]]);
                  return IndicatorChart(mode: desktopMode, indicator: dashboardState.trans[dashboardState.actual[index]] ?? 0);
                  //return IndicatorChart(mode: desktopMode, indicator: index);
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
