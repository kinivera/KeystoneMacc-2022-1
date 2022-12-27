import 'package:flutter/material.dart';
import 'package:responsivedashboard/constants.dart';

import 'package:responsivedashboard/Widgets/grid_buttons.dart';
import 'package:responsivedashboard/Widgets/indicator_chart.dart';
import 'package:responsivedashboard/Widgets/menu.dart';

import 'package:provider/provider.dart';
import 'package:responsivedashboard/StateManagement/home_view_widgets_state_manager.dart';

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
