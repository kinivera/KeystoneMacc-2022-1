import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:responsivedashboard/DataProvider/Storage/models.dart';

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
  late List<Measurement> data;
  late String plotName;
  late DateFormat formatter;
  late ZoomPanBehavior _zoomPanBehavior;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    // TODO: implement initState
    plotName = "${widget.variable.name} \t (${widget.variable.units})";
    formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
    _tooltipBehavior = TooltipBehavior(enable: true,
      opacity: 0.4,
      duration: 1);
    _zoomPanBehavior = ZoomPanBehavior(enablePinching: true,
      enablePanning: true,
      enableMouseWheelZooming: true,
      enableSelectionZooming: true,
      selectionRectBorderColor: Colors.blueAccent,
      selectionRectColor: Colors.grey,
      maximumZoomLevel: 0.9
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SfCartesianChart(

        tooltipBehavior: _tooltipBehavior,
        zoomPanBehavior: _zoomPanBehavior,
        primaryXAxis: DateTimeAxis(name: "Time",
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            dateFormat: formatter,
            title: AxisTitle(text: "Time")),

        primaryYAxis: NumericAxis(name: widget.variable.units,
          title: AxisTitle(text: plotName),),

        series: <LineSeries>[
          LineSeries(dataSource: widget.data,
              //each obj is a measurement from the list
              xValueMapper: (obj, indx)=>_xValueMapper(obj, indx),
              yValueMapper: (obj, indx)=>_yValueMapper(obj, indx),
              markerSettings: const MarkerSettings(isVisible: true),
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              enableTooltip: true,
            ),
        ],
        //borderWidth: 1,
        //color: Colors.lightGreen.withAlpha(100),
    );
  }

  dynamic _xValueMapper(dynamic obj, int? indx){
    if (obj != null){
      return DateTime.parse(obj.time);
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

