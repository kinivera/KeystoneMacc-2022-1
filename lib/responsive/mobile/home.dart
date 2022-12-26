import 'package:flutter/material.dart';
import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/util/gridButtons.dart';
import '../../util/Menu.dart';
import 'package:responsivedashboard/util/indicatorChart.dart';

import 'package:provider/provider.dart';
import 'package:responsivedashboard/states/homeWidgetStateManager.dart';

class HomeMenuMobile extends StatefulWidget {
  const HomeMenuMobile({Key? key}) : super(key: key);

  @override
  State<HomeMenuMobile> createState() => _HomeMenuMobileState();
}

class _HomeMenuMobileState extends State<HomeMenuMobile> {


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
            sliver:GridButtons(mode: mobileMode)
          ),

           SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return IndicatorChart(mode: desktopMode,
                                      indicator: index);//dashboardState.trans[dashboardState.actual[index]] ?? 0);
              },
              childCount: states.numberOfClickedVariables,
            ),
          ),
        ],
      ),
    );
  }
}
