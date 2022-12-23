import 'package:states_rebuilder/states_rebuilder.dart';

var dashboard = RM.inject(() => Dashboard());
var dashboardState = dashboard.state;

List<Map<String,dynamic>> initialStateMetrics = [
        {
            "Date": "00:00:00",
            "Close": 0
        },
      ];

class Dashboard {
      List<String> actual = [];
      Map<String, int> trans = {
        "temp":0,
        "hum":1,
        "pressure":2,
        "lux":3,
        "panel_voltage":4
      };

      List<Map<dynamic,dynamic>> indicators = [
        { "name":"temp",
          "beautyName":"Temperatura",
          "isSelected":false ,
          "data": initialStateMetrics
        },
        { "name":"hum",
          "beautyName":"Humedad",
          "isSelected":false,
          "data":initialStateMetrics
        },
        { "name":"pressure",
          "beautyName":"Presión",
          "isSelected":false,
          "data":initialStateMetrics
        },
        { "name":"lux",
          "beautyName":"Nivel de luz",
          "isSelected":false ,
          "data":initialStateMetrics
        },
        { "name":"panel_voltage",
          "beautyName":"Voltaje del Panel",
          "isSelected":false ,
          "data":initialStateMetrics
        },
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
        indicators[index]["data"] = dataList.isEmpty ? initialStateMetrics: dataList;
        dashboard.notify();
        print("dashboartd $index updated");
      }
}