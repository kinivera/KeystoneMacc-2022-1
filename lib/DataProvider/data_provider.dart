import 'package:flutter/material.dart';


//API connection and Persistend database connection
import 'ApiClient/api_client.dart';
import 'Storage/database.dart';
import 'Storage/model.dart';



class DataProvider with ChangeNotifier{
    ClientDatabase db = ClientDatabase();
    AppApiClient apiClient = AppApiClient();

    Future<void> init()async{
      await db.database;
    }


    /*
     *    SOME GETTERS
     */

    get loggedIn{
      return apiClient.loggedIn;
    }

    get loading{
      return apiClient.loading;
    }

    get signedIn{
      return apiClient.signedIn;
    }

    get nowUtc{
      return apiClient.nowUtc;
    }


    Future<List<Measurement>?> getMeasurement(int varId) async{
        List<Measurement>? result = await db.getMeasurement(varId);

        //the database does not have the requested information
        if (result == null){

            //requests the data to the Graphql API until now
            List<Object?> response = await apiClient.getMeasurements(endTime: nowUtc);

            //if there was a response then we store that information in the database
            //and at the same time we can get our response
            await _fromAPIResponseToDBMeasurement(response);
            result = await db.getMeasurement(varId);
        }

        return result;
    }


    Future<List<Variable>?> getAllVariables() async{
        List<Variable>? result = await db.getAllVariables();

        if ((result == null) || (result.isEmpty)){
            //requests the data to the Graphql API
            List<Object?> response = await apiClient.getAllVariables();

            await _fromAPIResponseToDBVariable(response);
            result = await db.getAllVariables();
        }

        return result;
    }

    Future<List<Variable>?> getDistinctVariables() async{
        List<Variable>? result = await db.getDistinctVariables();

        if ((result == null) || (result.isEmpty)){
            //requests the data to the Graphql API
            List<Object?> response = await apiClient.getAllVariables();

            await _fromAPIResponseToDBVariable(response);
            result = await db.getDistinctVariables();
        }

        return result;
    }

    /*
     *          SOME INTERNAL UTILS
     */

    Future<void> _fromAPIResponseToDBMeasurement(List<dynamic> response)async{
        for (int i = 0; i < response.length; i++){
            int varId = int.parse(response[i]?['variableId']);
            double value = response[i]?['value'] as double;
            String time = response[i]?['time'] as String;

            await db.insertMeasurement(varId, value, time);
        }
    }



    Future<void> _fromAPIResponseToDBVariable(List<dynamic> response) async{
        for (int i = 0; i < response.length; i++){
            debugPrint(response[i]?['id2']);
            debugPrint(response[i]?['id2'].runtimeType.toString());
            int id = int.parse(response[i]?['id2']);
            String name = response[i]?['name'] as String;
            String units = response[i]?['units'] as String;
            String desc = response[i]?['desc'] as String;

            await db.insertVariable(id, name, units, desc);
        }
    }
}