// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../states/indicatorStates.dart';
import 'dart:math' as m;

String correctJson2(String badJson) {
  RegExp simpleQ1 = RegExp(
      r"(?<!\:\s)\'(?!(\}|\,))"); //Busca las comillas simples que no tengan dos puntos y espacio (:" ") detras y corchete izquierdo (}) delante
  RegExp inBrackL = RegExp(
      r'\{(?!\")'); // Busca los corchetes { que no tengan una comilla doble al frente
  RegExp inBrackR = RegExp(
      r'(?<!\})\}'); //Busca los corchetes } que no tienen un segundo corchete después
  RegExp brackets = RegExp(r'(\{)|(\})'); //Busca todo los corchetes en el json

  RegExp mtBrackets = RegExp(r'\:\s?\{\}'); //Condicional 1.2

  String jsonChecker = badJson.substring(1, (badJson.length - 2));
  //-----------------------------------//
  if (jsonChecker.contains(brackets)) {
    String newString = badJson.replaceAll(
        simpleQ1, "\""); //Reemplaza las comillas simples encontradas por dobles
    if (jsonChecker.contains(mtBrackets)) {
      String newString2 = newString.replaceAll((inBrackL),
          "\"{0:"); //Reemplaza los corchetes por corchetes con comillas adelandte
      final newString3 =
          newString2.replaceAll(inBrackR, "'ND'}\""); //exlude last
      return newString3;
    } else {
      String newString2 = newString.replaceAll((inBrackL),
          "\"{"); //Reemplaza los corchetes por corchetes con comillas adelandte
      final newString3 = newString2.replaceAll(inBrackR, "}\""); //exlude last
      return newString3;
    }
  } else if (badJson.contains(RegExp(r'(?<=(\{|\,\s?))\d+(?=\:)'))) {
    final temp1 =
        badJson.replaceAllMapped(RegExp(r'(?<=(\{|\,\s?))\d+(?=\:)'), ((match) {
      return '"${match.group(0)}"';
    }));
    RegExp exp = RegExp(r"\'");
    if (badJson.contains(RegExp(r'datetime\.time'))) {
      final newString2 =
          temp1.replaceAll(RegExp(r'datetime\.time'), "\"datetime.time");
      final newString3 = newString2.replaceAll(RegExp(r'\)(?=(}||,))'), ")\"");
      final newString = newString3.replaceAll(exp, "\"");
      return newString;
    } else {
      final newString = temp1.replaceAll(exp, "\"");
      return newString;
    }
  } else {
    RegExp exp = RegExp(r"\'");
    final newString = badJson.replaceAll(exp, "\"");
    print(newString);
    return newString;
  }
}

class ApiConstants {
  static String baseUrl = 'http://perroshptasasociados.xyz:5000/graphql?query=';
}

class AuthCheck {
  final String message;
  final int status;
  const AuthCheck({
    required this.message,
    required this.status,
  });
  factory AuthCheck.fromJson(Map<String, dynamic> json) {
    return AuthCheck(message: json['message'], status: json['status']);
  }
}

class AV {
  final Map<String, dynamic> time;
  final Map<String, dynamic> varname;
  final Map<String, dynamic> value;
  const AV({required this.time, required this.varname, required this.value});
  factory AV.fromJson(Map<String, dynamic> json) {
    return AV(
        time: jsonDecode(correctJson2(json['time'])),
        varname: jsonDecode(correctJson2(json['varname'])),
        value: jsonDecode(correctJson2(json['value'])));
  }
}

class AVI {
  final Map<String, dynamic> time;
  final Map<String, dynamic> variable;
  final Map<String, dynamic> min_acceptable;
  final Map<String, dynamic> max_acceptable;
  final Map<String, dynamic> min_optimal;
  final Map<String, dynamic> max_optimal;

  const AVI({
    required this.time,
    required this.variable,
    required this.min_acceptable,
    required this.max_acceptable,
    required this.min_optimal,
    required this.max_optimal,
  });
  factory AVI.fromJson(Map<String, dynamic> json) {
    return AVI(
        time: jsonDecode(correctJson2(json['time'])),
        variable: jsonDecode(correctJson2(json['variable'])),
        min_acceptable: jsonDecode(correctJson2(json['min_acceptable'])),
        max_acceptable: jsonDecode(correctJson2(json['max_acceptable'])),
        min_optimal: jsonDecode(correctJson2(json['min_optimal'])),
        max_optimal: jsonDecode(correctJson2(json['max_optimal'])));
  }
}

class AC {
  final Map<String, dynamic> actuator_id;
  final Map<String, dynamic> time;
  final Map<String, dynamic> actuator_name;
  final Map<String, dynamic> start_time;
  final Map<String, dynamic> end_time;
  final Map<String, dynamic> time_on;
  final Map<String, dynamic> time_off;

  const AC({
    required this.actuator_id,
    required this.time,
    required this.actuator_name,
    required this.start_time,
    required this.end_time,
    required this.time_on,
    required this.time_off,
  });
  factory AC.fromJson(Map<String, dynamic> json) {
    return AC(
        actuator_id: jsonDecode(correctJson2(json['actuator_id'])),
        time: jsonDecode(correctJson2(json['time'])),
        actuator_name: jsonDecode(correctJson2(json['actuator_name'])),
        start_time: jsonDecode(correctJson2(json['start_time'])),
        end_time: jsonDecode(correctJson2(json['end_time'])),
        time_on: jsonDecode(correctJson2(json['time_on'])),
        time_off: jsonDecode(correctJson2(json['time_off'])));
  }
}

class ApiService {
  ApiConstants apiConstants = ApiConstants();

  //Autenticación
  Future<AuthCheck> authUserbyUsername(String user, String psswrd) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{authUserByUsername(username: "${user}", password: "${psswrd}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);

      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = json.decode(response.body);
        Map<String, dynamic> temp2 = temp['data'];

        return AuthCheck.fromJson(
            jsonDecode(correctJson2(temp2['authUserByUsername'])));
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<AuthCheck> authUserbyEmail(String email, String psswrd) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{authUserByEmail(email: "${email}", password: "${psswrd}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = json.decode(response.body);
        Map<String, dynamic> temp2 = temp['data'];
        return AuthCheck.fromJson(
            jsonDecode(correctJson2(temp2['authUserByEmail'])));
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  //Función para las variables ambientales
  Future<AV> getAV(String user, String apiKey, String vars, String timeStart,
      String timeFinish) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{ambientVariable(username: "${user}",apiKey: "${apiKey}",var: "${vars}",timestart: "${timeStart}",timefinish: "${timeFinish}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = json.decode(response.body);
        Map<String, dynamic> temp2 = temp['data'];
        return AV.fromJson(jsonDecode(correctJson2(temp2['ambientVariable'])));
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<AV> getAV2(
    String user,
    String apiKey,
  ) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{allAmbientVariables(username: "${user}",apiKey: "${apiKey}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = json.decode(response.body);
        Map<String, dynamic> temp2 = temp['data'];

        return AV
            .fromJson(jsonDecode(correctJson2(temp2['allAmbientVariables'])));
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  //Función para tener los intervalos
  Future<AVI> getAmVarInt(String user, String apiKey, String vars) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{ambientalVariableIntervals(username: "${user}", apiKey: "${apiKey}", var: "${vars}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      //print(encodedQuery);
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);
      var respuestasimulada =  [   {
        "Date": "21:41:38",
        "Close": m.Random().nextInt(100)
    },
    {
        "Date": "02:00:00",
        "Close":  m.Random().nextInt(100)
    }];

      dashboardState.updateData(1,respuestasimulada);
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = json.decode(response.body);
        Map<String, dynamic> temp2 = temp['data'];
        return AVI.fromJson(
            jsonDecode(correctJson2(temp2['ambientalVariableIntervals'])));
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<AVI> getAmVarInt2(String user, String apiKey) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{allAmbientalVariablesIntervals(username: "${user}", apiKey: "${apiKey}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = json.decode(response.body);
        Map<String, dynamic> temp2 = temp['data'];
        return AVI.fromJson(
            jsonDecode(correctJson2(temp2['allAmbientalVariablesIntervals'])));
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<AC> getActConfig(String user, String apiKey, String actName) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{actuatorsConfiguration(username: "${user}", apiKey: "${apiKey}", actuatorName: "${actName}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = json.decode(response.body);
        Map<String, dynamic> temp2 = temp['data'];
        print(temp2['actuatorsConfiguration']);
        return AC.fromJson(
            jsonDecode(correctJson2(temp2['actuatorsConfiguration'])));
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<AC> getActConfig2(String user, String apiKey) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{allActuatorConfiguration(username: "${user}", apiKey: "${apiKey}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = json.decode(response.body);
        Map<String, dynamic> temp2 = temp['data'];
        print(temp2['allActuatorConfiguration']);
        print(correctJson2(temp2['allActuatorConfiguration']));
        return AC.fromJson(
            jsonDecode(correctJson2(temp2['allActuatorConfiguration'])));
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  // Queries de Writing
  Future<String> writeAmbVarInterval(String user, String apiKey, String vars,
      List acceptableInterval, List optimalInterval) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{writeAmbientalVariableInterval(username: "${user}", apiKey: "${apiKey}", var: "${vars}",  acceptableInterval: ${acceptableInterval}, optimalInterval:${optimalInterval})}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> writing = json.decode(response.body)['data'];
        if (writing['writeAmbientalVariableInterval'] != "0") {
          return 'Error: problemas en grapphql, respuesta: ${writing['writeAmbientalVariableInterval']}';
        }
        return 'Proceso Existoso';
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<String> writeActuatorsConfig(
      String user,
      String apiKey,
      String actName,
      String startTime,
      String endTime,
      int onTime,
      int offTime) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{writeActuatorsConfiguration(username: "${user}", apiKey: "${apiKey}", actuatorName: "${actName}", startTime: "${startTime}", endTime: "${endTime}", onTime: ${onTime}, offTime: ${offTime})}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> writing = json.decode(response.body)['data'];
        Map<String, dynamic> writing2 =
            json.decode(correctJson2(writing['writeActuatorsConfiguration']));
        return writing2['message'];
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  //Funciones con los queries de add
  Future<String> addUser(String userName, String email, String psswrd) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{addUser(username: "${userName}", email: "${email}", password: "${psswrd}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = jsonDecode(response.body);
        if (temp.containsKey("errors")) {
          return "Parametros inválidos";
        }
        Map<String, dynamic> data = temp['data'];
        Map<String, dynamic> addUser =
            jsonDecode(correctJson2(data['addUser']));
        return addUser['message'];
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<String> addMicrcontroller(
      String user, String apiKey, String macAddress, String micName) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{addMicrocontroller(username: "${user}", apiKey: "${apiKey}", macAddress: "${macAddress}", micName: "${micName}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = jsonDecode(response.body);
        //if (temp["error"]) return "mal";
        Map<String, dynamic> temp2 = temp['data'];
        Map<String, dynamic> addUser =
            jsonDecode(correctJson2(temp2['addMicrocontroller']));
        return addUser['message'];
        //else
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<String> addTopic(String user, String apiKey, String topic) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{addTopic(username: "${user}", apiKey: "${apiKey}", topic: "${topic}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      var url = Uri.parse(encodedQuery);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Map<String, dynamic> temp = jsonDecode(response.body);
        //if (temp["error"]) return "mal";
        Map<String, dynamic> temp2 = temp['data'];
        Map<String, dynamic> addUser =
            jsonDecode(correctJson2(temp2['addTopic']));
        return addUser['message'];
        //else
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
