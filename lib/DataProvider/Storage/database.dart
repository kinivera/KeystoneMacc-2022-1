import 'dart:core';

import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'model.dart';
import 'package:flutter/material.dart';


//https://stackoverflow.com/questions/38933801/calling-an-async-method-from-a-constructor-in-dart

class ConcreteDatabaseException extends DatabaseException{

    ConcreteDatabaseException(String message) : super(message);

    get result{
    }

    @override
      int? getResultCode() {
      }
}

class ClientDatabase with ChangeNotifier{
    Database? _database;
    DBStatements  dbStatements = DBStatements();

    //constuctor
    ClientDatabase();


    /*
     *  Calls/Builds the database
     */
    Future<Database> get database async{
      if (_database != null) return _database!;

      _database = await _initDB('userClientDatabase.db');
      return _database!;
    }

    /*
     *  Initializes the database
     */

    Future<Database> _initDB(String filename) async{

        sqfliteFfiInit();
        DatabaseFactory databaseFactory = databaseFactoryFfi;

        Directory appSuppDir = await getApplicationSupportDirectory();
        String dbPath = join(appSuppDir.path, filename) ;

        Database db = await databaseFactory.openDatabase(dbPath,
            options: OpenDatabaseOptions(version: 1, onCreate: _createDB, onOpen: _openDB) );

        //by default sql lite does not come with foreign keys enabled
        db.execute(dbStatements.enableDatabaseForeignKeys());

        return db;
    }

    /*
     *  Creates the database from scratch
     */

    Future _openDB(Database db) async{
        debugPrint("\nOpening database...");
        db.execute(dbStatements.enableDatabaseForeignKeys());
        debugPrint("Done!\n");
    }

    Future _createDB(Database db, int version) async{
        debugPrint("\nCreating database...");
        db.execute(dbStatements.enableDatabaseForeignKeys());
        db.execute(dbStatements.createVariablesTable());
        db.execute(dbStatements.createMeasurementsTable());
        debugPrint("Done!\n");
    }

    /*
     *  Close database
     */
    Future<void> close() async {
        final Database db = await database;
        db.close();
    }

    Future<void> logOut()async{
        final Database db = await database;
        await db.delete(MeasurementFields.tableName);
        await db.delete(VariableFields.tableName);

        DatabaseFactory databaseFactory = databaseFactoryFfi;
        await databaseFactory.deleteDatabase('userClientDatabase.db');
    }


    /*
     *          INSERT OPERATIONS
     *
     */

    Future<Measurement> insertMeasurement(String id, int varId, double value, String time) async {
        Database db = await database;

        try{
            await db.rawInsert(dbStatements.insertMeasurement(id, varId, value, time));

        }on DatabaseException catch (e){
            String field = "${MeasurementFields.tableName}.${MeasurementFields.id}";
            ConcreteDatabaseException ex = ConcreteDatabaseException(e.toString());

            if (!ex.isUniqueConstraintError(field)){
                throw 'Unexpected Error: ${e.toString()}';
            }else{
                debugPrint("Repeated measurement");
            }

        }catch (e){
            throw e.toString();
        }

        return Measurement(id, varId, value, time);
    }

    Future<Variable> insertVariable(int id, String name, String units, String desc)async{
        Database db = await database;
        int rowId = await db.rawInsert(dbStatements.insertVariable(id, name, units, desc));

        return Variable(rowId, name, units, desc);
    }

    /*
     *          READ OPERATIONS
     *
     */

    Future<List<Measurement>> getMeasurement(int varId)async{
        Database db = await database;

        List<Map<String, Object?>> map  = await db.query(measurementsTableName,
            columns: [MeasurementFields.id, MeasurementFields.variableId,
                      MeasurementFields.value,  MeasurementFields.time],
            where: '${MeasurementFields.variableId} = ?', whereArgs: [varId],);

        List<Measurement> measurements = fromQueryResultToMeasurement(map);

        return measurements;
    }

    Future<List<Variable>> getAllVariables()async{
        Database db = await database;
        List<Map<String, Object?>> map  = await db.query(variablesTableName,
            columns: [VariableFields.id, VariableFields.name, VariableFields.units, VariableFields.desc]);

        List<Variable> variables =  fromQueryResultToVariable(map);
        return variables;
    }

    Future<List<Variable>> getDistinctVariables() async{
        Database db = await database;
        List<Map<String, Object?>> map  = await db.rawQuery(dbStatements.distinctVariables());

        List<Variable> variables =  fromQueryResultToVariable(map);
        return variables;
    }

    Future<bool> hasVariables()async{
        Database db = await database;
        List<Map<String, Object?>> map = await db.query(VariableFields.tableName);

        return map.isNotEmpty;
    }

    /*
     *          INTERNAL UTILS
     *
     */

    List<Measurement> fromQueryResultToMeasurement(List<Map<String, Object?>> map){
        List<Measurement> measurements = [];

        for(int i = 0; i < map.length; i++){
            String id = map[i][MeasurementFields.id] as String;
            int varId = map[i][MeasurementFields.variableId] as int;
            double value = map[i][MeasurementFields.value] as double;
            String time = map[i][MeasurementFields.time] as String;

            Measurement m = Measurement(id, varId, value, time);
            measurements.add(m);
        }

        return measurements;
    }

    List<Variable> fromQueryResultToVariable(List<Map<String, Object?>> map){
        List<Variable> variables = [];

        for(int i = 0; i < map.length; i++){
            int id = map[i][VariableFields.id] as int;
            String name = map[i][VariableFields.name] as String;
            String units = map[i][VariableFields.units] as String;
            String desc = map[i][VariableFields.desc] as String;

            Variable v = Variable(id, name, units, desc);
            variables.add(v);
        }

        return variables;
    }

}
