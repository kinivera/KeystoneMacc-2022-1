
const String measurementsTableName = 'measurements';
const String variablesTableName = 'variables';
const String conditionsTableName = 'conditions';
const String zonesTableName = 'zones';

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

  // Map constructor for the Measurement class.
  Measurement.fromMap(Map<String, dynamic> map):
        id = map['_id'],
        variableId = map['variableId'],
        value = map['value'],
        time = map['time'];

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

  // Map constructor for the Variable class.
  Variable.fromMap(Map<String, dynamic> map):
        id = map['_id'],
        name = map['name'],
        units = map['units'],
        desc = map['desc'];
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

  // Map constructor for the Conditions class.
  Conditions.fromMap(Map<String, dynamic> map):
        id = map['_id'],
        idVar = map['idVar'],
        min = map['min'],
        max = map['max'];

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

  // Map constructor for the Zones class.
  Zones.fromMap(Map<String, dynamic> map):
        id = map['_id'],
        idOrg = map['idOrg'],
        name = map['name'],
        coordinates = map['coordinates'];

}

