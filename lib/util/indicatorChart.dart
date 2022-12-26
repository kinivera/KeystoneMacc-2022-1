// ignore_for_file: file_names

import 'dart:async';
import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'LineChartWidget.dart';
import 'package:provider/provider.dart';
import 'package:responsivedashboard/states/homeWidgetStateManager.dart';


//this indicator chart is the one which is shown in the home page
//and has two parts
/*
        ---------------------------------------------
        |               VariableName                |
        ---------------------------------------------
        |                Plot-Chart                 |
        |                                           |
        |             /\                            |
        |       /-.-.-   \-.-.-                     |
        |  -.-.-                                    |
        ---------------------------------------------
 */

class IndicatorChart extends StatefulWidget{
  final String mode;
  final int indicator;

  const IndicatorChart({super.key, required this.mode, required this.indicator});

  @override
  State<IndicatorChart> createState() => IndicatorChartState();
}

class IndicatorChartState extends State<IndicatorChart> {
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds:updateSeconds), ((Timer t) =>{
    }));
}

  /// disappear
  @override
  void dispose() {
  super.dispose();
  _timer.cancel();
  /// release whatever you have consume
  }

  @override
  Widget build(BuildContext context) {
    HomeAmbientVariableDashboard states =  Provider.of<HomeAmbientVariableDashboard>(context);

    return  Column(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        //---------------------------------------------------------------------
        //                    Upper Variable Name
        //---------------------------------------------------------------------

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: AutoSizeText(
            states.getVarName(widget.indicator),
            maxLines: 2,
            minFontSize: 12,
            maxFontSize: 45,
            style: const TextStyle(height: 5, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),


        //---------------------------------------------------------------------
        //                    Main Plot Chart
        //---------------------------------------------------------------------

        //        Data Chart
        const Center(child: CustomLineChart(),),
      ]);
  }
}

class ChartSampleData {
  final DateTime? x;
  final double? yValue;
  final barColor = "blue";
  ChartSampleData({this.x, this.yValue});
}



