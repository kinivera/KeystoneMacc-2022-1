// ignore: file_names
import 'package:flutter/material.dart';
import 'package:responsivedashboard/Widgets/button.dart';

import 'package:provider/provider.dart';
import 'package:responsivedashboard/StateManagement/home_view_widgets_state_manager.dart';

class GridButtons extends StatefulWidget {
  final String mode;
  const GridButtons({Key? key, required this.mode}) : super(key: key);

  @override
  State<GridButtons> createState() => _GridButtonsState();
}

class _GridButtonsState extends State<GridButtons> {
  @override
  Widget build(BuildContext context) {
    HomeAmbientVariableDashboard states = Provider.of<HomeAmbientVariableDashboard>(context);
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 30.0,
        crossAxisSpacing: 30.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          // Define el icono que quieres mostrar en cada botón
          IconData icon;
          if (index == 0) {
            icon = Icons.cloud;
          } else if (index == 1) {
            icon = Icons.water_drop;
          } else if (index == 2) {
            icon = Icons.thermostat;
          } else if (index == 3) {
            icon = Icons.science;
          } else if (index == 4) {
            icon = Icons.lightbulb;
          } else{
            icon = Icons.electric_bolt;
          }
          // Crea el widget Button y pasa el icono como argumento
          return Button(
            mode: widget.mode,
            indicator: index,
            icon: Icon(icon),
          );
        },
        childCount: states.variableNumber,
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String mode;
  final int indicator;
  final Icon icon; // agrega un nuevo parámetro para el icono

  const Button({Key? key, required this.mode, required this.indicator, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // Cambia la dirección de la sombra
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon, // Muestra el icono en el botón
          const SizedBox(height: 10),
          Text(

            'Button $indicator',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

