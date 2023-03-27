/*
 *      STATEMENTS FOR CREATING ALL TABLES IN THE DATABASE
 */

const String measurementsTableName = 'measurements';
const String variablesTableName = 'variables';
const String conditionsTableName = 'conditions';
const String zonesTableName = 'zones';


class DBStatements{

    static const String txt = 'TEXT ';
    static const String integer = 'INTEGER ';

    static const String nn = 'NOT NULL ';
    static const String pk = 'PRIMARY KEY ';
    static const String real = 'REAL ';

    /*
      static const String idTypeMeasurements = 'TEXT PRIMARY KEY';
      static const String idTypeVarId = 'INTEGER PRIMARY KEY';
      static const String varIdType = 'INTEGER NOT NULL';
      static const String realType = 'REAL NOT NULL';
      static const String textType = 'TEXT NOT NULL';
     */

  String enableDatabaseForeignKeys(){
    return '''PRAGMA foreign_keys = ON''';
  }
    
  /*
   *        CREATE STATEMENTS
   */

  String createMeasurementsTable(){
      return '''CREATE TABLE ${MeasurementFields.tableName}(
      ${MeasurementFields.id} ${integer + pk},
      ${MeasurementFields.variableId} ${integer + nn},
      ${MeasurementFields.value} ${real + nn},
      ${MeasurementFields.time} ${txt + nn},
      FOREIGN KEY (${MeasurementFields.variableId}) REFERENCES ${VariableFields.tableName}(${VariableFields.id})
      ); ''';
  }

  String createVariablesTable(){
      return ''' CREATE TABLE ${VariableFields.tableName}(
      ${VariableFields.id} ${integer + pk}, 
      ${VariableFields.name} ${txt + nn}, 
      ${VariableFields.units} ${txt + nn}, 
      ${VariableFields.desc} ${txt + nn}
      );
      ''';
  }

    String createZonesTable(){
      return ''' CREATE TABLE ${ZonesFields.tableName}(
      ${ZonesFields.id} ${integer + pk}, 
      ${ZonesFields.idOrg} ${integer + nn}, 
      ${ZonesFields.name} ${txt + nn}, 
      ${ZonesFields.coordinates} ${txt + nn}
      );
      ''';
    }

    String createConditionsTable(){
      return ''' CREATE TABLE ${ConditionsFields.tableName}(
      ${ConditionsFields.id} ${integer + pk}, 
      ${ConditionsFields.idVar} ${integer + nn}, 
      ${ConditionsFields.min} ${real + nn}, 
      ${ConditionsFields.max} ${real + nn}
      FOREIGN KEY (${ConditionsFields.idVar}) REFERENCES ${VariableFields.tableName}(${VariableFields.id})
      );
      ''';
    }

  /*
   *        SELECT STATEMENTS
   */

    String distinctVariables(){
      return '''SELECT ${VariableFields.id}, ${VariableFields.units}, ${VariableFields.desc},
        ${VariableFields.name} FROM ${VariableFields.tableName} GROUP BY ${VariableFields.name}''';
    }

  /*
   *        INSERT STATEMENTS
   */

  String insertMeasurement(String id, int variableId, double value, String time){
      return '''INSERT INTO ${MeasurementFields.tableName}(
      ${MeasurementFields.id}, 
      ${MeasurementFields.variableId}, 
      ${MeasurementFields.value},
      ${MeasurementFields.time}) VALUES ("$id", $variableId, $value, "$time");
      ''';
  }

  String insertVariable(int id, String name, String units, String desc){
      return '''INSERT INTO ${VariableFields.tableName}(
        ${VariableFields.id}, 
        ${VariableFields.name},
        ${VariableFields.units},
        ${VariableFields.desc}) VALUES ($id, "$name", "$units", "$desc");
        ''';
  }

  String insertZone(int id, int idOrg, String name, String coordinates){
    return '''INSERT INTO ${ZonesFields.tableName}(
        ${ZonesFields.id}, 
        ${ZonesFields.idOrg},
        ${ZonesFields.name},
        ${ZonesFields.coordinates}) VALUES ($id, $idOrg, "$name", "$coordinates");
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



//------------------------------------------------------------------------------
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

//Measurement object

class Measurement{
    final String id;
    final int variableId;
    final double value;
    final String time;

    const Measurement(this.id, this.variableId, this.value, this.time);

    @override
    String toString() {
      String str = "Measurement{$id, $variableId, $value, '$time'}";
      return str;
    }

    // Convert a Measurement into a Map.
    Map<String, dynamic> toMap() {
        return {
          '_id': id,
          'variableId': variableId,
          'value': value,
          'time': time
        };
    }
}


//------------------------------------------------------------------------------
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

//Variable object

class Variable{
  final int id;
  final String name;
  final String units;
  final String desc;

  const Variable(this.id, this.name, this.units, this.desc);

  @override
  String toString() {
    String str = "Variable{$id, '$name', '$units', '$desc'}";
    return str;
  }

  // Convert a Variable into a Map.
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'units': units,
      'desc': desc
    };
  }

}


//------------------------------------------------------------------------------
/*
 *
 *      Conditions Fields and Definition
 *
 */


class ConditionsFields{
  static const String tableName = conditionsTableName;

  //define column names
  static const String id = "id_crop";
  static const String idVar = "id_variable";
  static const String min = "min";
  static const String max = "max";
}

//Conditions object

class Conditions{
  final int id;
  final String idVar;
  final double min;
  final double max;

  const Conditions(this.id, this.idVar, this.min, this.max);

  @override
  String toString() {
    String str = "Conditions{$id, '$idVar', $min, $max}";
    return str;
  }

  // Convert a Variable into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id_crop': id,
      'id_variable': idVar,
      'min': min,
      'max': max
    };
  }

}

//------------------------------------------------------------------------------
/*
 *
 *      Zone Fields and Definition
 *
 */


class ZonesFields{
  static const String tableName = zonesTableName;

  //define column names
  static const String id = "_id";
  static const String idOrg = "id_org";
  static const String name = "name";
  static const String coordinates = "coordinates";
}

//Conditions object
class Zones{
  final int id;
  final String idOrg;
  final String name;
  final String coordinates;

  const Zones(this.id, this.idOrg, this.name, this.coordinates);

  @override
  String toString() {
    String str = "Zones{$id, '$idOrg', $name, $coordinates}";
    return str;
  }

  // Convert a Variable into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_org': idOrg,
      'name': name,
      'coordinates': coordinates
    };
  }

}


