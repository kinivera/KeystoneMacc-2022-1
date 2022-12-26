import 'package:flutter/material.dart';
import 'package:responsivedashboard/util/indicatorChart.dart';
import '../../constants.dart';
import '../../util/Menu.dart';
import '../../util/gridButtons.dart';
import '../../states/indicatorStates.dart';


import 'package:provider/provider.dart';
import 'package:responsivedashboard/states/homeWidgetStateManager.dart';


class HomeMenuDesktop extends StatefulWidget {
  const HomeMenuDesktop({Key? key}) : super(key: key);

  @override
  State<HomeMenuDesktop> createState() => _HomeMenuDesktopState();
}

class _HomeMenuDesktopState extends State<HomeMenuDesktop> {

  @override
  Widget build(BuildContext context) {
    HomeAmbientVariableDashboard states =  Provider.of<HomeAmbientVariableDashboard>(context);

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

          SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return IndicatorChart(mode: desktopMode, indicator: index);
                },
                childCount: states.numberOfClickedVariables,
              ),
            ),

        ],
      ),
    );
  }
}
