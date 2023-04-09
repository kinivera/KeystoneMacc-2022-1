import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsivedashboard/DataProvider/Storage/models.dart';


//API connection and Persistend database connection
import 'ApiClient/api_client.dart';
import 'Storage/database.dart';
import 'Storage/db_statements.dart';



class DataProvider with ChangeNotifier {
    ClientDatabase db = ClientDatabase();
    AppApiClient apiClient = AppApiClient();


    //variables for time management
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
    late String _lastTimeUtc;
    late String _nowUtc;

    //variables for updates managment
    late Timer _timer;
    int updateEveryNSeconds = 40;

    Future<void> init() async {
        return await null;
    }


    /*
     *    SOME PROPERTIES GETTERS
     */

    get loggedIn {
        return true; // apiClient.loggedIn;
    }

    get loading {
        return false; //apiClient.loading;
    }

    get signedIn {
        return true; //apiClient.signedIn;
    }

    get nowUtc {
        return _nowUtc;
    }

    get lastTimeUtc{
        return _lastTimeUtc;
    }

    /*
     *    SOME DATA GETTERS
     */

    Future<List<Measurement>> getMeasurement(int varId) async {
        List<Measurement> placeholder = [];
        return await placeholder;
    }


    Future<List<Variable>> getAllVariables() async {
        List<Variable> placeholder = [];
        return await placeholder;
    }

    Future<List<Variable>> getDistinctVariables() async {
        List<Variable> placeholder = [];
        return await placeholder;
    }

    /*
     *          WRAPPERS
     */

    Future<void> logIn(String username, String password) async{
        return await null;
    }

    Future<void> signIn(String username, String email,  String password) async{
        return await null;
    }



    /*
     *          UPDATE OPERATIONS
     */

    Future<void> updateMeasurements()async{
        return await null;
    }


    /*
     *          SOME INTERNAL UTILS
     */

    Future<void> _fromAPIResponseToDBMeasurement(List<dynamic> response) async {
        return await null;
    }


    Future<void> _fromAPIResponseToDBVariable(List<dynamic> response) async {
        return await null;
    }


    Future<void> _atLogIn()async{
        return await null;
    }

}