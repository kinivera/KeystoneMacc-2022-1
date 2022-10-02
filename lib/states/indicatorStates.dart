import 'package:states_rebuilder/states_rebuilder.dart';

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