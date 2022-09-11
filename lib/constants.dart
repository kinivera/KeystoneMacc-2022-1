// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

// Colores
const defaultBackgroundColor = Color(0XFFFFFFFF);
const defaultBackgroundColorSecondary = Color(0XFF627583);
const menuColorText =  Color(0XFF576271);
const menuColorBackgr = Color(0XFFA9BF5A);
const drawerTextColor = TextStyle(
  color: menuColorText
);

var topBar = AppBar(
  backgroundColor: menuColorBackgr,
  title: const Text('Smart Sensor', style:drawerTextColor),
  centerTitle: false,
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var menu = Drawer(
  backgroundColor: menuColorBackgr,
  elevation: 0,
  child: Column(
    children: [
      const DrawerHeader(
        child: Icon(
          Icons.compost,
          color:menuColorText,
          size: 64,
        ),
      ),
      Padding(
        padding: tilePadding,
        child: const ListTile(
          leading: Icon(Icons.add_task, color:menuColorText),
          title: Text(
            'E X P O R T   S E L E C T E D\nD A T A ',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: const ListTile(
          leading: Icon(Icons.file_download, color:menuColorText),
          title: Text(
            'E X P O R T   A L L  D A T A ',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: const ListTile(
          leading: Icon(Icons.settings, color:menuColorText),
          title: Text(
            'S E T T I N G S',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: const ListTile(
          leading: Icon(Icons.info, color:menuColorText),
          title: Text(
            'A B O U T',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: const ListTile(
          leading: Icon(Icons.logout, color:menuColorText),
          title: Text(
            'L O G O U T',
            style: drawerTextColor,
          ),
        ),
      ),
    ],
  ),
);
var gridButtons = GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 80,
  mainAxisSpacing: 10,
  crossAxisCount: 4,
  children: <Widget>[
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/presion.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en presion');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/temperatura.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en temperatura');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/poder.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en bateria');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/humedad.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en humedad');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/idea-fresca.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en bombillo');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/voltaje.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en voltaje');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/mas.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en mas');}),
  ],
);


var gridButtons2 = GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 80,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/presion.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en presion');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/temperatura.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en temperatura');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/poder.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en bateria');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/humedad.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en humedad');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/idea-fresca.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en bombillo');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/voltaje.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en voltaje');}),
    GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: defaultBackgroundColorSecondary,
        image: const DecorationImage(
              image: AssetImage("/images/mas.png"),
              fit: BoxFit.fill),
      ),
    ),onTap: (){debugPrint('Diste click en mas');}),
  ],
);