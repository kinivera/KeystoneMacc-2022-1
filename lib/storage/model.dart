
class CreateTablesStatements{

  const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  const String varIdType = 'INTEGER NOT NULL';
  const String realType = 'REAL NOT NULL';
  const String textType = 'TEXT NOT NULL';

  String createMeasurementsTable(){


    return ''' CREATE TABLE ${MeasurementFields.tableName}(
    ${MeasurementFields.id} $idType,
    ${MeasurementFields.variableId} $varIdType,
    ${MeasurementFields.value} $realType,
    ${MeasurementFields.time} $textType,
    ) ''';
  }

}


class MeasurementFields{
  static const String tableName = 'measurements';

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

