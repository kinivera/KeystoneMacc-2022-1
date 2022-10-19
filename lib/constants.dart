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

const invalidData = [
    {
        "Date": "21:41:38",
        "Close": 20.61164195213798
    },
    {
        "Date": "02:41:38",
        "Close": 22.443617002073974
    },
    {
        "Date": "07:41:38",
        "Close": 22.664587720683983
    },
    {
        "Date": "12:41:38",
        "Close": 24.760182794597668
    },
    {
        "Date": "17:41:38",
        "Close": 20.704467225851275
    },
    {
        "Date": "22:41:38",
        "Close": 23.305247963357118
    },
    {
        "Date": "03:41:38",
        "Close": 22.12329393001669
    },
    {
        "Date": "08:41:38",
        "Close": 20.689369694742584
    },
    {
        "Date": "13:41:38",
        "Close": 21.739963794050265
    },
    {
        "Date": "18:41:38",
        "Close": 20.453875177014584
    },
    {
        "Date": "23:41:38",
        "Close": 22.988396444916177
    },
    {
        "Date": "04:41:38",
        "Close": 23.71217662433394
    },
    {
        "Date": "09:41:38",
        "Close": 21.968319643878857
    },
    {
        "Date": "14:41:38",
        "Close": 21.192507234403287
    },
    {
        "Date": "19:41:38",
        "Close": 21.095217701682788
    },
    {
        "Date": "00:41:38",
        "Close": 20.628512470276426
    },
    {
        "Date": "05:41:38",
        "Close": 22.445047408646474
    },
    {
        "Date": "10:41:38",
        "Close": 23.427640209604334
    },
    {
        "Date": "15:41:38",
        "Close": 20.2327079424831
    },
    {
        "Date": "20:41:38",
        "Close": 23.141019079095578
    },
    {
        "Date": "01:41:38",
        "Close": 22.79330226916703
    },
    {
        "Date": "06:41:38",
        "Close": 23.159222633917622
    },
    {
        "Date": "11:41:38",
        "Close": 23.195874439967824
    },
    {
        "Date": "16:41:38",
        "Close": 20.29729744170734
    },
    {
        "Date": "21:41:38",
        "Close": 21.10763434597112
    }
];
