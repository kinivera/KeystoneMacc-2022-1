
const String cropsTableName         = 'crops';
const String variablesTableName     = 'variables';
const String conditionsTableName    = 'conditions';
const String measurementsTableName  = 'measurements';

//------------------------------------------------------------------------------
/*
 *
 *      Crop Fields and Definition
 *
 */


class CropFields{
  static const String tableName = cropsTableName;

  //define column names
  static const String id = "_id";
  static const String name = "name";
  static const String latitude = "latitude";
  static const String longitude = "longitude";
}

class Crop{
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  const Crop(this.id, this.name, this.latitude, this.longitude);

  // Map constructor for the Variable class.
  Crop.fromMap(Map<String, dynamic> map):
        id = map['_id'],
        name = map['name'],
        latitude = map['latitude'],
        longitude = map['longitude'];

  @override
  String toString() {
    String str = "Variable{$id, '$name', '$latitude', '$longitude'}";
    return str;
  }

  // Convert a Variable into a Map.
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude
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

  // Map constructor for the Variable class.
  Variable.fromMap(Map<String, dynamic> map):
        id = map['_id'],
        name = map['name'],
        units = map['units'],
        desc = map['desc'];

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
  static const String id = "_id";
  static const String idCrop = "id_crop";
  static const String idVar = "id_variable";
  static const String min = "min";
  static const String max = "max";
}

//Conditions object

class Conditions{
  final int id;
  final int idCrop;
  final String idVar;
  final double min;
  final double max;

  const Conditions(this.id, this.idCrop, this.idVar, this.min, this.max);

  // Map constructor for the Conditions class.
  Conditions.fromMap(Map<String, dynamic> map):
        id = map['_id'],
        idCrop = map['idCrop'],
        idVar = map['idVar'],
        min = map['min'],
        max = map['max'];

  // Convert a Variable into a Map.
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'id_crop': idCrop,
      'id_variable': idVar,
      'min': min,
      'max': max
    };
  }

  @override
  String toString() {
    String str = "Conditions{$id, '$idVar', $min, $max}";
    return str;
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
  static const String idCrop = "idCrop";
  static const String variableId = "variableId";
  static const String value = "value";
  static const String time = "time";
}

//Measurement object

class Measurement{
  final int id;
  final int idCrop;
  final int variableId;
  final double value;
  final String time;

  const Measurement(this.id, this.idCrop, this.variableId, this.value, this.time);

  // Map constructor for the Measurement class.
  Measurement.fromMap(Map<String, dynamic> map):
        id = map['_id'],
        idCrop = map['idCrop'],
        variableId = map['variableId'],
        value = map['value'],
        time = map['time'];

  @override
  String toString() {
    String str = "Measurement{$id, $idCrop, $variableId, $value, '$time'}";
    return str;
  }

  // Convert a Measurement into a Map.
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'idCrop': idCrop,
      'variableId': variableId,
      'value': value,
      'time': time
    };
  }
}