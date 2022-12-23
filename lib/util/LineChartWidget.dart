import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


class CustomLineChart extends StatefulWidget {
  const CustomLineChart({Key? key}) : super(key: key);

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
                                      child: LineChart(),),
                ],
    );
  }
}


class LineChart extends StatelessWidget {
  const LineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SfCartesianChart(

        primaryXAxis: CategoryAxis(name: "Time"),
        primaryYAxis: NumericAxis(),

        series: <ChartSeries>[
          //ColumnSeries(dataSource: dataSource, xValueMapper: xValueMapper, yValueMapper: yValueMapper),
        ],
        //borderWidth: 1,
        //color: Colors.lightGreen.withAlpha(100),
    );
  }
}
