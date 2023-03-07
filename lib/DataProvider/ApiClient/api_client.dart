import 'package:flutter/material.dart';

import '/DataProvider/ApiClient/entry_point_queries.dart';


/*
 *
 *            API CLIENT DEFINITION
 *
 */

class AppApiClient with ChangeNotifier {

  late Queries queries;
  late String _apiKey;

  Map<String, Object?> responses = {};
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

  AppApiClient() {
    //instance of the class which contains the string queries
    queries = const Queries();
  }


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
  Future<void> authUser(String username, String password) async {
    await null;
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

}