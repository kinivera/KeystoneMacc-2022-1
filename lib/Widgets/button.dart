import 'package:flutter/material.dart';
import '../constants.dart';

import 'package:provider/provider.dart';
import 'package:responsivedashboard/StateManagement/home_view_widgets_state_manager.dart';

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
    HomeAmbientVariableDashboard states =  Provider.of<HomeAmbientVariableDashboard>(context);

    return InkWell(
      onTap: ()async{
          setState((){
            states.changeStateClick(widget.indicator);
          });
        },

      onHover:(hovered)async{
        setState((){
          states.changeStateHover(widget.indicator);
        });
      },

      child: Container(
        padding: const EdgeInsets.all(paddingBackgroundImages),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.mode == desktopMode ? 60.0 : 360.0),
          color: !(states.isClicked(widget.indicator) || states.isHovered(widget.indicator))
                   ? defaultBackgroundColorSecondary : menuColorBackgr
        ),
        child: Image.asset("assets/icons/ambientVariableDashboard/${states.getVarName(widget.indicator)}.png"),
      )
    );
  }
}

