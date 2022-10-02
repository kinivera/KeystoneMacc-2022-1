// ignore: file_names
import 'package:flutter/material.dart';
import '../constants.dart';


class Button extends StatefulWidget{
  final String mode;
  final int indicator;
  const Button({super.key, required this.mode, required this.indicator});

  @override
  State<Button> createState() => ButtonState();
}

class ButtonState extends State<Button> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('Diste click en ${dashboardState.indicators[widget.indicator]["name"]}');
        setState((){
          dashboardState.indicators[widget.indicator]["isSelected"]=!( dashboardState.indicators[widget.indicator]["isSelected"] as bool);
          if(dashboardState.indicators[widget.indicator]["isSelected"] as bool){
            dashboardState.removeIndicator(dashboardState.indicators[widget.indicator]["name"] as String);

          }
          else{
            dashboardState.addIndicator(dashboardState.indicators[widget.indicator]["name"] as String);
          }
        });
        print(dashboardState.actual);
        },
      onHover:(hovered){
        setState((){dashboardState.indicators[widget.indicator]["isSelected"]=!(dashboardState.indicators[widget.indicator]["isSelected"] as bool);});
      },
      child: Container(
        padding: const EdgeInsets.all(paddingBackgroundImages),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.mode == desktopMode ? 60.0 : 360.0),
          color: !(dashboardState.indicators[widget.indicator]["isSelected"] as bool) ? defaultBackgroundColorSecondary : menuColorBackgr
        ),
        child: Image.asset("/images/${dashboardState.indicators[widget.indicator]["name"]}.png"),
      )
    );
  }
}

