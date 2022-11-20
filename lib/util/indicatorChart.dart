// ignore_for_file: file_names

import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';

import 'package:graphic/graphic.dart';
import '../api-client/api_client.dart';
import '../../states/indicatorStates.dart';
import '../../constants.dart';


class IndicatorChart extends StatefulWidget{
  final String mode;
  final int indicator; 

  const IndicatorChart({super.key, required this.mode, required this.indicator});

  @override
  State<IndicatorChart> createState() => IndicatorChartState();
}

class IndicatorChartState extends State<IndicatorChart> {
   ApiService api = ApiService();
  late Timer _timer;
  late Future<AuthCheck> _checkingAuth;
  late Future<AV> _ambientVariables;
  late Future<AVI> _ambVarInterval;
  

  @override
  void initState() {
    super.initState();
    
    String user ='dave';
    String token ='46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8';
    String sensor =  dashboardState.indicators[widget.indicator]["name"];

    api.getAV(user, token, sensor, searchIntervals["beginDate"] ?? "2022/11/10 00:00:01", searchIntervals["endDate"] ?? "2022/11/16 23:00:01");
    _timer = Timer.periodic(const Duration(seconds:updateSeconds), ((Timer t) =>{
      //print("$sensor ${dashboardState.indicators[widget.indicator]["isSelected"] ? "selected" : "not selected"}"),
      api.getAV(user, token, sensor,searchIntervals["beginDate"] ?? "2022/11/10 00:00:01", searchIntervals["endDate"] ?? "2022/11/16 23:00:01")
    }));

    //_checkingAuth = api.authUser("dave", "supertactica");
    //_ambientVariables = api.getAV( user, token, sensor, '2022/10/02 00:00:00','2022/10/05 00:00:00');
       
    //_ambVarInterval = api.getAmVarInt(user, token, sensor);
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
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          dashboardState.indicators[widget.indicator]["beautyName"],
          style: const TextStyle(height: 5, fontSize: 50, fontWeight: FontWeight.bold)
        ),
        Container(
                margin: const EdgeInsets.only(top: 10),
                width: 10000,
                height: 300,
                child: Chart(
                  data: dashboardState.indicators[widget.indicator]["data"],
                  variables: {
                    'Date': Variable(
                      accessor: (Map map) => map['Date'] as String,
                      scale: OrdinalScale(tickCount: 5),
                    ),
                    'Close': Variable(
                      accessor: (Map map) =>
                          (map['Close'] ?? double.nan) as num,
                    ),
                  },
                  elements: [
                    AreaElement(
                      shape: ShapeAttr(value: BasicAreaShape(smooth: true)),
                      color: ColorAttr(
                          value: Defaults.colors10.first.withAlpha(80)),
                    ),
                    LineElement(
                      shape: ShapeAttr(value: BasicLineShape(smooth: true)),
                      size: SizeAttr(value: 0.5),
                    ),
                  ],
                  axes: [
                    Defaults.horizontalAxis,
                    Defaults.verticalAxis,
                  ],
                  selections: {
                    'touchMove': PointSelection(
                      on: {
                        GestureType.scaleUpdate,
                        GestureType.tapDown,
                        GestureType.longPressMoveUpdate
                      },
                      dim: Dim.x,
                    )
                  },
                  tooltip: TooltipGuide(
                    followPointer: [false, true],
                    align: Alignment.topLeft,
                    offset: const Offset(-20, -20),
                  ),
                  crosshair: CrosshairGuide(followPointer: [false, true]),
                )),
              ]);
  }
}

class ChartSampleData {
  final DateTime? x;
  final double? yValue;
  final barColor = "blue";

  ChartSampleData({this.x, this.yValue});
}