import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../states/indicatorStates.dart';
import 'dart:math' as m;

String correctJson2(String badJson) {
  if (badJson
      .substring(1, (badJson.length - 2))
      .contains(RegExp(r'(\{)|(\})'))) {
    RegExp exp = RegExp(
        r"(?<!\:\s)\'(?!\})"); //Busca las comillas simples que no tengan (:" ") detras y (}) delante}
    RegExp exp2 = RegExp(
        r'\{(?!\")'); // Busca los corchetes { que no tengan una comilla doble al frente
    RegExp exp3 = RegExp(
        r'(?<!\})\}'); //Busca los corchetes } que no tienen un segundo corchete después

    final newString = badJson.replaceAll(
        exp, "\""); //Reemplaza las comillas simples encontraadas por dobles

    final newString2 = newString.replaceAll((exp2),
        "\"{"); //Reemplaza los corchetes por corchetes con comillas adelandte
    final newString3 = newString2.replaceAll(exp3, "}\""); //exlude last
    return newString3;
  } else if (badJson.contains(RegExp(r'(?<=\{)\d(?=\:)'))) {
    final temp1 =
        badJson.replaceAllMapped(RegExp(r'(?<=\{)\d(?=\:)'), ((match) {
      return '"${match.group(0)}"';
    }));
    RegExp exp = RegExp(r"\'");
    final newString = temp1.replaceAll(exp, "\"");
    return newString;
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

class ApiService {
  ApiConstants apiConstants = ApiConstants();

//Objetivos:
  //Hacer más query
  Future<AuthCheck> authUser(String user, String psswrd) async {
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
        throw Exception('none');
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
          '${ApiConstants.baseUrl}{ambientalVariableIntervals(username: "${user}", apiKey: "${apiKey}", var: "${vars}", timestart: "${timeStart}", timefinish: "${timeFinish}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      print(encodedQuery);
      print('---');
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

  //Función para tener los intervalos
  Future<AVI> getAmVarInt(String user, String apiKey, String vars) async {
    try {
      String query =
          '${ApiConstants.baseUrl}{ambientalVariableIntervals(username: "${user}", apiKey: "${apiKey}" var: "${vars}")}';
      String encodedQuery = Uri.encodeFull(query);
      // ignore: avoid_print
      //print(encodedQuery);
      print('---' + (vars as String));
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
}
