import 'dart:core';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

import 'package:graphic/graphic.dart';
import '../api-client/api_client.dart';
import '../constants.dart';

class IndicatorChart extends StatefulWidget{
  final String mode;
  final int indicator; 

  const IndicatorChart({super.key, required this.mode, required this.indicator});

  @override
  State<IndicatorChart> createState() => IndicatorChartState();
}

class IndicatorChartState extends State<IndicatorChart> {
   ApiService api = ApiService();

  late Future<AuthCheck> _checkingAuth;
  late Future<AV> _ambientVariables;
  late Future<AVI> _ambVarInterval;

  @override
  void initState() {
    super.initState();
    _checkingAuth = api.authUser("dave", "supertactica");
    /**_ambientVariables = api.getAV( 'dave',
        '46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8',
        'temperature');
    **/
    _ambVarInterval = api.getAmVarInt(
        'dave',
        '46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8',
        'temperature');
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: invalidData,
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
                ),
              );
  }
}

class ChartSampleData {
  final DateTime? x;
  final double? yValue;
  final barColor = "blue";

  ChartSampleData({this.x, this.yValue});
}