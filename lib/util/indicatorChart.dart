import 'package:flutter/material.dart';
import '../constants.dart';
import '../../states/indicatorStates.dart';

class IndicatorChart extends StatefulWidget{
  final String mode;
  final int indicator;

  const IndicatorChart({super.key, required this.mode, required this.indicator});

  @override
  State<IndicatorChart> createState() => IndicatorChartState();
}

class IndicatorChartState extends State<IndicatorChart> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 10,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      color: Colors.lightBlue[100 * (widget.indicator % 9)],
      child: Text('Chart of Item ${dashboardState.actual[widget.indicator]}'),
    );
  }
}

