
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';



class MeasurementsDatabase{
    static Database? _database;

    MeasurementsDatabase(){
      _database = null;
    }

    /*
        gets the database
     */
    Future<Database> get database async{
      if (_database != null) return _database!;

      _database = await _initDB('userMeasurementsDatabase.db');
      return _database!;
    }

    /*
        Initializes the database
     */

    Future<Database> _initDB(String filename) async{

        sqfliteFfiInit();
        DatabaseFactory databaseFactory = databaseFactoryFfi;

        Directory appSuppDir = await getApplicationSupportDirectory();
        String dbPath = join(appSuppDir.path, filename) ;

        return await databaseFactory.openDatabase(dbPath,
                                                  options: OpenDatabaseOptions(version: 1,
                                                            onCreate: _createDB) );

    }

    Future _createDB(Database db, int version) async{


    }

    /*
        Close database
     */
    Future close() async {
        final Database db = await database;
        db.close();
    }

    }