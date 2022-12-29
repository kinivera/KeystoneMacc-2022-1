// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
import 'dart:core';

import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/DataProvider/data_provider.dart';
import 'package:responsivedashboard/DataProvider/Storage/model.dart';
import 'package:responsivedashboard/StateManagement/home_view_widgets_state_manager.dart';

import 'line_chart_widget.dart';


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

  // Variables for getting the state of the widget
  late HomeAmbientVariableDashboard _states;

  // Variables for getting chart data
  late DataProvider _client;

  // Plot specific variables
  late Variable _variable;
  late List<Measurement> _data;


  @override
  void initState() {
    // TODO: implement initState
    _data = [];
    _variable = Variable(-1, "default variable", "arbitrary", "place holder.");
    Timer.periodic(const Duration(seconds: 40), (timer) async{
      await updateChartData();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    _states = Provider.of<HomeAmbientVariableDashboard>(context);
    _client = Provider.of<DataProvider>(context);

    Variable? gotedVar = _states.getVar(widget.indicator);
    if(gotedVar!= null){
      _variable = gotedVar;
    }



    return Visibility( visible: _states.isClicked(widget.indicator),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          //---------------------------------------------------------------------
          //                    Upper Variable Name
          //---------------------------------------------------------------------

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: AutoSizeText(
              _states.getVarName(widget.indicator),
              maxLines: 2,
              minFontSize: 12,
              maxFontSize: 45,
              style: const TextStyle(
                  height: 5, fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),


          //---------------------------------------------------------------------
          //                    Main Plot Chart
          //---------------------------------------------------------------------

          //        Data Chart
          Center(child: CustomLineChart(variable: _variable, data: _data),),

        ]));
    }

    Future<void> updateChartData() async{
      _data = await _client.getMeasurement(_variable.id);
    }

}


