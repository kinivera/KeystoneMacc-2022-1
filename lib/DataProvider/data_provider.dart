import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


//API connection and Persistend database connection
import 'ApiClient/api_client.dart';
import 'Storage/database.dart';
import 'Storage/model.dart';



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
        await db.database;
        _timer = Timer.periodic(Duration(seconds: updateEveryNSeconds), (timer) async{
            await updateMeasurements();
        });
        notifyListeners();
    }


    /*
     *    SOME PROPERTIES GETTERS
     */

    get loggedIn {
        return apiClient.loggedIn;
    }

    get loading {
        return apiClient.loading;
    }

    get signedIn {
        return apiClient.signedIn;
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
        List<Measurement> result = await db.getMeasurement(varId);

        //the database does not have the requested information
       if (result.isEmpty) {
            //requests the data to the Graphql API until now
            List<Object?> response = await apiClient.getMeasurements(endTime: nowUtc);

            //if there was a response then we store that information in the database
            //and at the same time we can get our response
            await _fromAPIResponseToDBMeasurement(response);
            result = await db.getMeasurement(varId);
        }

        return result;
    }


    Future<List<Variable>> getAllVariables() async {
        List<Variable> result = await db.getAllVariables();

        if (result.isEmpty) {
            //requests the data to the Graphql API
            List<Object?> response = await apiClient.getAllVariables();

            await _fromAPIResponseToDBVariable(response);
            result = await db.getAllVariables();
        }

        return result;
    }

    Future<List<Variable>> getDistinctVariables() async {
        List<Variable> result = await db.getDistinctVariables();

        if (result.isEmpty) {
            //requests the data to the Graphql API
            List<Object?> response = await apiClient.getAllVariables();

            await _fromAPIResponseToDBVariable(response);
            result = await db.getDistinctVariables();
        }

        return result;
    }

    /*
     *          WRAPPERS
     */

    Future<void> logIn(String username, String password) async{
        await apiClient.authUser(username, password);

        if (loggedIn){
            _nowUtc =  formatter.format(DateTime.now().toUtc()).toString();
            _atLogIn();
            debugPrint("LOG IN DATE: $_nowUtc");
        }
    }

    Future<void> signIn(String username, String email,  String password) async{
        await apiClient.signIn(username, email, password);

        if (signedIn){
            _nowUtc =  formatter.format(DateTime.now().toUtc()).toString();
            debugPrint("SIGN IN DATE: $_nowUtc");
        }
    }



    /*
     *          UPDATE OPERATIONS
     */

    Future<void> updateMeasurements()async{
        _lastTimeUtc = _nowUtc;
        _nowUtc =  formatter.format(DateTime.now().toUtc()).toString();

        debugPrint("Updating measurements from $_lastTimeUtc to $_nowUtc...");
        //requests data in a recent time-span to update measurements
        List<Object?> response = await apiClient.getMeasurements(startTime: _lastTimeUtc,
                                                                 endTime: _nowUtc);
        await _fromAPIResponseToDBMeasurement(response);
        debugPrint("Done updating measurements!");
    }


    /*
     *          SOME INTERNAL UTILS
     */

    Future<void> _fromAPIResponseToDBMeasurement(List<dynamic> response) async {
        for (int i = 0; i < response.length; i++) {
            //debugPrint("IDDDDDDDDDDD!!!!!!!!!!");
            //debugPrint(response[i]?["id"]);
            String id = response[i]?["id"];
            int varId = response[i]?[MeasurementFields.variableId];
            double value = response[i]?[MeasurementFields.value] as double;
            String time = response[i]?[MeasurementFields.time] as String;

            await db.insertMeasurement(id, varId, value, time);
        }
    }


    Future<void> _fromAPIResponseToDBVariable(List<dynamic> response) async {
        for (int i = 0; i < response.length; i++) {
            debugPrint(response[i]?['id2']);
            debugPrint(response[i]?['id2'].runtimeType.toString());
            int id = int.parse(response[i]?['id2']);
            String name = response[i]?['name'] as String;
            String units = response[i]?['units'] as String;
            String desc = response[i]?['desc'] as String;

            await db.insertVariable(id, name, units, desc);
        }
    }


    Future<void> _atLogIn()async{
        debugPrint("Setting up data provider database...");
        await init();
        bool hasVariables =  await db.hasVariables();
        late List<Object?> response;


        if (!hasVariables){
            debugPrint("Found no variables in the database");
            //requests the ambiental variables to the API and stores them
            //in the local database
            response = await apiClient.getAllVariables();
            await _fromAPIResponseToDBVariable(response);
        }

        //requests the measurements until now to the API and stores them
        //in the local database
        response = await apiClient.getMeasurements(endTime: nowUtc);
        await _fromAPIResponseToDBMeasurement(response);
        debugPrint("Done setting up data provider...");
    }

}