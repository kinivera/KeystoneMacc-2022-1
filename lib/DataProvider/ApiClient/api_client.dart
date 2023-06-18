import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:flutter/material.dart';

/*
 *
 *            PATHS DEFINITION
 *
 */

class Paths{
  const Paths();

  static String baseUrl = "http://0.0.0.0:8000/api/";

  /*---------------ORG RELATED-----------------------*/
  static String orgCreate   = 'org/new/';
  static String orgDetails  = 'org/';
  static String orgModify   = 'org/mod/';
  static String orgDelete   = 'org/del/';

  /*---------------CROP RELATED-----------------------*/
  static String cropCreate = 'crop/new/';
  static String cropDetail = 'crop/';
  static String cropModify = 'crop/mod/';
  static String cropDel    = 'crop/del/';

  /*---------------ACTUATOR RELATED-----------------------*/
  static String actuatorCreate = 'actuator/new/';
  static String actuatorDetail = 'actuator/';
  static String actuatorModify = 'actuator/mod/';
  static String actuatorDel    = 'actuator/del/';

  /*---------------ACTUATOR RELATED-----------------------*/
  static String actuatorTypeCreate = 'actuatortype/new/';
  static String actuatorTypeDetail = 'actuatortype/';
  static String actuatorTypeModify = 'actuatortype/mod/';
  static String actuatorTypeDel    = 'actuatortype/del/';

  /*---------------CONDITION RELATED-----------------------*/
  static String conditionCreate = 'condition/new/';
  static String conditionDetail = 'condition/';
  static String conditionModify = 'condition/mod/';
  static String conditionDel    = 'condition/del/';

  /*---------------MEASUREMENT RELATED-----------------------*/
  static String measurementCreate = 'measurement/new/';
  static String measurementDetail = 'measurement/';
  static String measurementModify = 'measurement/mod/';
  static String measurementDel    = 'measurement/del/';

  /*---------------VARIABLE RELATED-----------------------*/
  static String variableCreate = 'variable/new/';
  static String variableDetail = 'variable/';
  static String variableModify = 'variable/mod/';
  static String variableDel    = 'variable/del/';

  /*---------------USER RELATED-----------------------*/
  static String userCreate = 'user/new/';
  static String userLogin  = 'user/login/';
  static String tokenAuth  = 'user/token_auth/';
}

/*
 *
 *            API CLIENT DEFINITION
 *
 */

class AppApiClient with ChangeNotifier{

  late String _apiKey;

  bool _signedIn = false;
  bool _loggedIn = false;
  bool _loading = false;


  /*
   *          GETTERS
   */

  get loggedIn{
    return _loggedIn;
  }

  get loading{
    return _loading;
  }

  get signedIn{
    return _signedIn;
  }


  /*
   *          CONSTRUCTOR
   */

  AppApiClient();

  /*
   *
   *           METHODS
   *
   */

  void logOut(){
    _apiKey = '';
    _loggedIn = false;
    _signedIn = false;
  }

  /*
      User Log In
   */
  Future<void> authUser(String username, String password)async{
    String requestURL = Paths.baseUrl + Paths.userLogin;
    Uri url = Uri.parse(requestURL);

    Response r = await http.post(url, body: {'username': username, 'password': password});

    if ((r.statusCode == 200) ){
      _loggedIn = true;
      print(r.body);
    }else{
      print("reques failed ${r.statusCode}");
    }

  }

  /*
      User Sign In
   */

  Future<void> signIn(String username, String email, String password)async{

    String requestURL = Paths.baseUrl + Paths.userCreate;
    Uri url = Uri.parse(requestURL);

    Response r = await http.post(url, body: {'username': username,
                                             'password': password,
                                             'email': email,
                                             'first_name': username,
                                             'last_name': username});

    if ((r.statusCode == 200) || (r.statusCode == 201)){
      _signedIn = true;
      print(r.body);
    }else{
      print("request failed ${r.statusCode}");
    }
  }

  /*
   *
   *         GETTERS FROM API (QUERIES)
   *
   */

  /*
      Get all ambient variables available
   */
  Future<List<Object?>> getAllVariables() async{
    return await [];
  }

  /*
      Get all measurements between a time span
   */
  Future<List<Object?>> getMeasurements({nMeasurements = 100,
                                         startTime = "",
                                         endTime = ""}) async{
    return await [];
  }


}


/*
 *
 *              OTHER UTILS
 *
 */

bool isPasswordValid(String password) => password.length >= 8;
bool isUserValid(String user) => (user.length >= 4) && (user.length <= 60);
bool isEmailValid(String email) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}
