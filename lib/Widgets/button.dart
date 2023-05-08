import 'package:flutter/material.dart';
import '../constants.dart';

import 'package:provider/provider.dart';
import 'package:responsivedashboard/StateManagement/home_view_widgets_state_manager.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class Button extends StatefulWidget {
  final String mode;
  final int indicator;
  const Button({super.key, required this.mode, required this.indicator});

  @override
  State<Button> createState() => ButtonState();
}

class ButtonState extends State<Button> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeAmbientVariableDashboard states =
        Provider.of<HomeAmbientVariableDashboard>(context);
    void showGraphDis(BuildContext context) {
      Widget graphDis = Container(
        width: 1000,
        height: 1000,
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 900,
                    child: SfCartesianChart(
                      // Initialize category axis
                      primaryXAxis: CategoryAxis(),

                      series: <LineSeries<AmbVarData, String>>[
                        LineSeries<AmbVarData, String>(
                            // Bind data source

                            dataSource: <AmbVarData>[
                              AmbVarData('6/5/2023', 35),
                              AmbVarData('7/5/2023', 28),
                              AmbVarData('8/5/2023', 34),
                              AmbVarData('9/5/2023', 32),
                              AmbVarData('10/5/2023', 40)
                            ],
                            xValueMapper: (AmbVarData a, _) => a.tiempo,
                            yValueMapper: (AmbVarData a, _) => a.valorval),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 900,
                    child: SfCartesianChart(
                      // Initialize category axis
                      primaryXAxis: CategoryAxis(),

                      series: <LineSeries<AmbVarData, String>>[
                        LineSeries<AmbVarData, String>(
                            // Bind data source

                            dataSource: <AmbVarData>[
                              AmbVarData('6/5/2023', 53),
                              AmbVarData('7/5/2023', 82),
                              AmbVarData('8/5/2023', 43),
                              AmbVarData('9/5/2023', 23),
                              AmbVarData('10/5/2023', 40)
                            ],
                            xValueMapper: (AmbVarData a, _) => a.tiempo,
                            yValueMapper: (AmbVarData a, _) => a.valorval),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return AlertDialog(
            title: const Text('Graphics'),
            content: graphDis,
          );
        },
      );
    }

    return InkWell(
        onTap: () async {
          setState(() {
            states.changeStateClick(widget.indicator);
          });
          showGraphDis(context);
        },
        onHover: (hovered) async {
          setState(() {
            states.changeStateHover(widget.indicator);
          });
        },
        child: Container(
          padding: const EdgeInsets.all(paddingBackgroundImages),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  widget.mode == desktopMode ? 60.0 : 360.0),
              color: !(states.isClicked(widget.indicator) ||
                      states.isHovered(widget.indicator))
                  ? defaultBackgroundColorSecondary
                  : menuColorBackgr),
          child: Image.asset(
              "assets/icons/ambientVariableDashboard/${states.getVarName(widget.indicator)}.png"),
        ));
  }
}

class AmbVarData {
  AmbVarData(this.tiempo, this.valorval);
  final String tiempo;
  final double valorval;
}
