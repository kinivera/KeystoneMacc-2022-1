import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'model.dart';
import 'package:flutter/material.dart';


//https://stackoverflow.com/questions/38933801/calling-an-async-method-from-a-constructor-in-dart

class MeasurementsDatabase with ChangeNotifier{
    Database? _database;
    DBStatements  dbStatements = DBStatements();

    //constuctor
    MeasurementsDatabase();


    /*
     *  Calls/Builds the database
     */
    Future<Database> get database async{
      if (_database != null) return _database!;

      _database = await _initDB('userMeasurementsDatabase.db');
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
            options: OpenDatabaseOptions(version: 1, onCreate: _createDB) );

        //by default sql lite does not come with foreign keys enabled
        db.execute(dbStatements.enableDatabaseForeignKeys());

        return db;
    }

    /*
     *  Creates the database from scratch
     */

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
    Future close() async {
        final Database db = await database;
        db.close();
    }


    /*
     *          INSERT OPERATIONS
     *
     */

    Future<Measurement> insertMeasurement(int varId, double value, String time) async {
        Database db = await database;
        await db.execute(dbStatements.insertMeasurement(varId, value, time));

        return Measurement(null, varId, value, time);
    }

    Future<Variable> insertVariable(int id, String name, String units, String desc)async{
        Database db = await database;
        await db.execute(dbStatements.insertVariable(id, name, units, desc));

        return Variable(id, name, units, desc);
    }

}