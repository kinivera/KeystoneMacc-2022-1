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

//'pressure', 4474: 
//'hum', 4475: 
//'lux', 4476: 
//'temp', 4477: 

const indexIndicators = ["temp","battery","hum","lux","vol","more"];