import 'package:flutter/material.dart';
import 'package:responsivedashboard/userDataProvider/storage/model.dart';


//API connection and Persistend database connection
import 'api-client/api-client.dart';
import 'storage/database.dart';



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



    /*
     *          SOME INTERNAL UTILS
     */

    Future<void> _fromAPIResponseToDBMeasurement(List<dynamic> response)async{
        for (int i = 0; i < response.length; i++){
            int varId = response[i]?['variableId'];
            double value = response[i]?['value'];
            String time = response[i]?['time'];

            Measurement m = await db.insertMeasurement(varId, value, time);
        }
    }




}