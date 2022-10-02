import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

// General constants
const desktopMode = "Desktop";
const mobileMode = "Mobile";

// Colores
const defaultBackgroundColor = Color(0XFFFFFFFF);
const defaultBackgroundColorSecondary = Color(0XFF627583);
const menuColorText =  defaultBackgroundColorSecondary;
const menuColorBackgr = Color(0XFFA9BF5A);
const paddingBackgroundImages = 30.0;
const drawerTextColor = TextStyle(
  color: menuColorText
);

var topBar = AppBar(
  backgroundColor: menuColorBackgr,
  title: const Text('Smart Sensor', style:drawerTextColor),
  centerTitle: false,
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);


var dashboard = RM.inject(() => Dashboard());
var dashboardState = dashboard.state;

class Dashboard {
  List<String> actual = [];
  var indicators = [
    {  "name":"temperatura", "isSelected":false },
    {  "name":"poder", "isSelected":false},
    {  "name":"humedad", "isSelected":false },
    {  "name":"idea-fresca", "isSelected":false },
    {  "name":"voltaje", "isSelected":false },
    {  "name":"mas", "isSelected":false },
  ];

  void addIndicator(String element) {
    actual.add(element);
    dashboard.notify();
  }

  void removeIndicator(String element) {
    actual.remove(element);
    dashboard.notify();
  }

  void selectIndicator(int index){
    indicators[index]["isSelected"] = !(indicators[index]["isSelected"] as bool);
    dashboard.notify();
  }
}