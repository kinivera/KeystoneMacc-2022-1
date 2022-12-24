/*
 *      STATEMENTS FOR CREATING ALL TABLES IN THE DATABASE
 */
const String measurementsTableName = 'measurements';
const String variablesTableName = 'variables';


class DBStatements{

    static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    static const String varIdType = 'INTEGER NOT NULL';
    static const String realType = 'REAL NOT NULL';
    static const String textType = 'TEXT NOT NULL';


  String enableDatabaseForeignKeys(){
    return '''PRAGMA foreign_keys = ON''';
  }
    
  /*
   *        CREATE STATEMENTS
   */

  String createMeasurementsTable(){
      return ''' CREATE TABLE ${MeasurementFields.tableName}(
      ${MeasurementFields.id} $idType,
      ${MeasurementFields.variableId} $varIdType,
      ${MeasurementFields.value} $realType,
      ${MeasurementFields.time} $textType,
      FOREIGN KEY (${MeasurementFields.variableId}) REFERENCES ${VariableFields.tableName}(${VariableFields.id})
      ); ''';
  }

  String createVariablesTable(){
      return ''' CREATE TABLE ${VariableFields.tableName}(
      ${VariableFields.id} $idType, 
      ${VariableFields.name} $textType, 
      ${VariableFields.units} $textType, 
      ${VariableFields.desc} $textType
      );
      ''';
  }



  /*
   *        INSERT STATEMENTS
   */

  String insertMeasurement(int variableId, double value, String time){
      return '''INSERT INTO ${MeasurementFields.tableName}(
      ${MeasurementFields.variableId}, 
      ${MeasurementFields.value},
      ${MeasurementFields.time}) VALUES ($variableId, $value, '$time');
      ''';
  }

  String insertVariable(int id, String name, String units, String desc){
      return '''INSERT INTO ${VariableFields.tableName}(
        ${VariableFields.id}, 
        ${VariableFields.name},
        ${VariableFields.units},
        ${VariableFields.desc}) VALUES ($id, $name, $units, $desc);
        ''';
  }

  /*
   *        DELETE STATEMENTS
   */

    String deleteAllVariables(){
      return '''DELETE FROM ${VariableFields.tableName};''';
    }

    String deleteAllMeasurements(){
      return '''DELETE FROM ${MeasurementFields.tableName};''';
    }

}

/*
 *
 *      Measurement Fields and Definition
 *
 */

class MeasurementFields{
  static const String tableName = measurementsTableName;

  //define column names
  static const String id = "_id";
  static const String variableId = "variableId";
  static const String value = "value";
  static const String time = "time";
}


class Measurement{
  final int? id;
  final int? variableId;
  final double? value;
  final String? time;

  const Measurement(this.id, this.variableId, this.value, this.time);
}

/*
 *
 *      Variable Fields and Definition
 *
 */

class VariableFields{
  static const String tableName = variablesTableName;

  //define column names
  static const String id = "_id";
  static const String name = "name";
  static const String units = "units";
  static const String desc = "desc";
}

class Variable{
  final int? id;
  final String? name;
  final String? units;
  final String? desc;

  const Variable(this.id, this.name, this.units, this.desc);
}
