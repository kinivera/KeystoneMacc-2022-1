// ignore: file_names
import 'package:flutter/material.dart';
import '../constants.dart';
import '../util/Button.dart';

class GridButtons extends StatelessWidget {
  final String mode;
  const GridButtons({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return 
    SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 30.0,
        crossAxisSpacing: 30.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Button(mode: mode, indicator: index);
        },
        childCount: 6,
      ),
);}}
