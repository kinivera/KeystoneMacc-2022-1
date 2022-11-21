import 'package:flutter/material.dart';

import 'api-client/api_client.dart';

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

//colores val
const kPrimaryColor = Color(0xa8bb5b);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const double defaultPadding = 16.0;

const int limitData = 15; /// ultimos x datos.
const int updateSeconds = 30; /// Cada x segundos se actualiza cada grafica.
const Map<String,String> searchIntervals = {
  "beginDate":"2012/11/10 00:00:01",
  "endDate":"2023/11/16 23:00:01"
}; //intervalos de busqueda para las variables