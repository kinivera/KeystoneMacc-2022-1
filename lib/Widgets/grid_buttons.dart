// ignore: file_names
import 'package:flutter/material.dart';
import 'package:responsivedashboard/Widgets/button.dart';

import 'package:provider/provider.dart';
import 'package:responsivedashboard/StateManagement/home_view_widgets_state_manager.dart';

class GridButtons extends StatefulWidget {
  final String mode;
  const GridButtons({super.key, required this.mode});

  @override
  State<GridButtons> createState() => _GridButtonsState();
}

class _GridButtonsState extends State<GridButtons> {
  @override
  Widget build(BuildContext context) {
    HomeAmbientVariableDashboard states =  Provider.of<HomeAmbientVariableDashboard>(context);
    return
    SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 30.0,
        crossAxisSpacing: 30.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Button(mode: widget.mode, indicator: index);
        },
        childCount: states.variableNumber, //dashboardState.indicators.length,
      ),
);}}
