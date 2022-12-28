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

  late HomeAmbientVariableDashboard _states;
  late DataProvider _client;
  late StreamController _dataStream;

  late Variable _variable;
  late Timer _timer;
  late List<Measurement> _data;

  @override
  void initState() {
    // TODO: implement initState
    _data = [];
    _variable = Variable(-1, "default variable", "arbitrary", "place holder.");
    _dataStream = StreamController<List<Measurement>>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //_timer.cancel();
    //_dataStream.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _states = Provider.of<HomeAmbientVariableDashboard>(context);
    _client = Provider.of<DataProvider>(context);

    //every minute it adds data to the stream
    _timer = Timer.periodic(const Duration(seconds: 40), (timer) async {
      _dataStream.add(await getData(_states, _client, widget.indicator));
    });

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
          Center(child:
          StreamBuilder(
              stream: _dataStream.stream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                bool noDataAtAll = ((!snapshot.hasData) && (_data.isEmpty));

                if (noDataAtAll) {
                  return Container(width: 50,
                                   height: 50,
                                   child: CircularProgressIndicator(),
                                   margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                                  );

                } else {
                  if (snapshot.data != null) {
                    _data = snapshot.data;
                  }
                  return CustomLineChart(variable: _variable, data: snapshot.data);
                }
              }
            ),
          ),

        ]));
    }
}


Future<List<Measurement>?> getData(HomeAmbientVariableDashboard states,
                                   DataProvider client,
                                   int indicator)async{

  Variable? variable = states.getVar(indicator);
  debugPrint(variable.toString());

  List<Measurement> data = [];

  if (variable != null){
    debugPrint("Quering measurement ${variable.id}");
    List<Measurement>? response = await client.getMeasurement(variable.id);
    debugPrint("got ${response.toString()}");
    if (response != null){
      data = response;
    }
  }

  return data;
}
