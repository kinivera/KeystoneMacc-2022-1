import 'package:states_rebuilder/states_rebuilder.dart';

var dashboard = RM.inject(() => Dashboard());
var dashboardState = dashboard.state;

class Dashboard {
  List<String> actual = [];
  Map<String, int> trans = {
    "temperatura":0,
    "poder":1,
    "humedad":2,
    "idea-fresca":3,
    "voltaje":4,
    "mas":5
  };

  List<Map<dynamic,dynamic>> indicators = [
    { "name":"temperatura",
      "isSelected":false ,
      "data":[
        {
            "Date": "21:41:38",
            "Close": 1
        },
        {
            "Date": "02:00:00",
            "Close": 7
        },
      ]
    },
    { "name":"poder",
      "isSelected":false,
      "data":[
        {
            "Date": "21:41:38",
            "Close": 1
        },
        {
            "Date": "02:00:00",
            "Close": 7
        },
      ]
    },
    { "name":"humedad",
      "isSelected":false,
      "data":[
        {
            "Date": "21:41:38",
            "Close": 1
        },
        {
            "Date": "02:00:00",
            "Close": 7
        },
      ]
    },
    { "name":"idea-fresca",
      "isSelected":false ,
      "data":[
        {
            "Date": "21:41:38",
            "Close": 1
        },
        {
            "Date": "02:00:00",
            "Close": 7
        },
      ]
    },
    { "name":"voltaje",
      "isSelected":false ,
      "data":[
        {
            "Date": "21:41:38",
            "Close": 1
        },
        {
            "Date": "02:00:00",
            "Close": 7
        },
      ]
    },
    { "name":"mas",
      "isSelected":false ,
      "data":[
        {
            "Date": "21:41:38",
            "Close": 1
        },
        {
            "Date": "02:00:00",
            "Close": 7
        },
      ]
    }
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

  void updateData(int index, List<Map<dynamic,dynamic>> dataList ){
    indicators[index]["data"] = dataList;
    dashboard.notify();
  }
}