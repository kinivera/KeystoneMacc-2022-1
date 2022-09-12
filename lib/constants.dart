// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

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
var menu = Drawer(
  backgroundColor: menuColorBackgr,
  elevation: 0,
  child: Column(
    children: [
      const DrawerHeader(
        child: null,
        decoration: BoxDecoration(
                color: menuColorBackgr,
                image: DecorationImage(
                  image: AssetImage("/images/logoApp.png")),
      )),
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