import 'dart:core';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

class IndicatorChart extends StatefulWidget{
  final String mode;
  final int indicator;

  const IndicatorChart({super.key, required this.mode, required this.indicator});

  @override
  State<IndicatorChart> createState() => IndicatorChartState();
}

class IndicatorChartState extends State<IndicatorChart> {
 List<Series<ChartSampleData, DateTime>> chartData = [
    Series<ChartSampleData, DateTime>(
      displayName: "nombreeeee",
      data:[
        ChartSampleData(x: DateTime(2015, 1, 2, 2), yValue: 1.12),
        ChartSampleData(x: DateTime(2015, 1, 3, 3), yValue: 1.08),
        ChartSampleData(x: DateTime(2015, 1, 4, 4), yValue: 1.12),
        ChartSampleData(x: DateTime(2015, 1, 5, 5), yValue: 1.1),
        ChartSampleData(x: DateTime(2015, 1, 6, 6), yValue: 1.12),
        ChartSampleData(x: DateTime(2015, 1, 7, 7), yValue: 1.1),
        ChartSampleData(x: DateTime(2015, 1, 8, 8), yValue: 1.12),
        ChartSampleData(x: DateTime(2015, 1, 9, 9), yValue: 1.16),
        ChartSampleData(x: DateTime(2015, 1, 10, 10), yValue: 1.1),
      ],
      domainFn: (ChartSampleData data, _) => data.x!,
      measureFn: (ChartSampleData data, _) => data.yValue,
      colorFn: (ChartSampleData pd, _) => const Color(r:120,g:120, b: 120),
      id: 'Test')
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 500,
              width: 320,
              child: TimeSeriesChart(
                animationDuration: const Duration(seconds: 1),
                animate: true,
                chartData 
              )
              );
  }
}

class ChartSampleData {
  final DateTime? x;
  final double? yValue;
  final barColor = "blue";

  ChartSampleData({this.x, this.yValue});
}