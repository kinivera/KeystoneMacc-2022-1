import 'package:flutter/material.dart';

// Colores
const defaultBackgroundColor = Color.fromARGB(255, 161, 44, 44);
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
            'E X P O R T   S E L E C T E D  D A T A ',
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
var migrid = GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[100],
      child: const Text("He'd have you all unravel at the"),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[200],
      child: const Text('Heed not the rabble'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[300],
      child: const Text('Sound of screams but the'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[400],
      child: const Text('Who scream'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[500],
      child: const Text('Revolution is coming...'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[600],
      child: const Text('Revolution, they...'),
    ),
  ],
);