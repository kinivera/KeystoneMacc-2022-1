import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '/DataProvider/ApiClient/api_constants.dart';


/*
 *
 *            API CLIENT DEFINITION
 *
 */

class AppApiClient with ChangeNotifier {

  ApiConstants queries = const ApiConstants();
  late String _apiKey;

  bool _signedIn = false;
  bool _loggedIn = false;
  bool _loading = false;

  /*
   *          GETTERS
   */

  get loggedIn {
    return _loggedIn;
  }

  get loading {
    return _loading;
  }

  get signedIn {
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

  void logOut() {
    _loggedIn = false;
    _signedIn = false;
    _loading = false;
    _apiKey = '';
  }

  /*
      User Log In
   */
  Future<void> logIn(String username, String password) async {
    Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.logIn);
    await ask(url);

    return;
  }

  /*
      User Sign In
   */

  Future<void> signIn(String username, String email, String password) async {
    await null;
    return;
  }

  /*
   *
   *         GETTERS FROM API (QUERIES)
   *
   */

  /*
      Get all ambient variables available
   */
  Future<List<Object?>> getAllVariables() async {
      await null;
      return [];
  }

  /*
      Get all measurements between a time span
   */
  Future<List<Object?>> getMeasurements({startTime = "",
                                         endTime = ""}) async {
      await null;
      return [];
  }


  /*
   *
   *         UTILS
   *
   */

  Future<dynamic> ask(Uri url)async{
    try{
      http.Response response =  await http.get(url);

      if (response.statusCode == 200) {
        dynamic decodedResponse = jsonDecode(response.body);
        return decodedResponse;
      }else{
        return null;
      }

    }catch (e){
      debugPrint(e.toString());
      return null;
    }
  }

}