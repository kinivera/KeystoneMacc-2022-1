import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:responsivedashboard/DataProvider/Storage/model.dart';

class CustomLineChart extends StatefulWidget {
  final Variable variable;
  final List<Measurement> data;
  const CustomLineChart({super.key, required this.variable, required this.data});

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}


class _CustomLineChartState extends State<CustomLineChart> {


  @override
  Widget build(BuildContext context) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                   Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: 710,
                    height: 400,
                    child: LineChart(variable: widget.variable, data: widget.data),
                   )
                ],
        );
  }
}


/*
 *
 * 
 */

class LineChart extends StatefulWidget {
  final Variable variable;
  final List<Measurement> data;
  const LineChart({super.key, required this.variable, required this.data});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  @override
  Widget build(BuildContext context) {

    return SfCartesianChart(

        primaryXAxis: CategoryAxis(name: "Time"),
        primaryYAxis: NumericAxis(name: widget.variable.units),
        //legend: Legend(isVisible: true),

        series: <ChartSeries>[
          ColumnSeries(dataSource: widget.data,
              //each obj is a measurement from the list
              xValueMapper: (obj, indx)=>_xValueMapper(obj, indx),
              yValueMapper: (obj, indx)=>_yValueMapper(obj, indx),
            ),
        ],
        //borderWidth: 1,
        //color: Colors.lightGreen.withAlpha(100),
    );
  }

  dynamic _xValueMapper(dynamic obj, int? indx){
    if (obj != null){
      return obj.time;
    }
    return 'time';
  }

  dynamic _yValueMapper(dynamic obj, int? indx){
    if (obj != null){
      return obj.value;
    }
    return 0;
  }

}

