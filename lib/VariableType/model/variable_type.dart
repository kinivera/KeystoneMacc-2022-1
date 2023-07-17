class VariableType {
  String id;
  String name;
  String units;
  String description;

  VariableType({
    required this.id,
    required this.name,
    required this.units,
    required this.description,
  });

  factory VariableType.fromJson(Map<String, dynamic> json) => VariableType(
        id: json["id"],
        name: json["name"],
        units: json["unit"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "unit": unit,
        "description": description,
      };

  @override
  String toString() {
    return 'VariableType{id: $id, name: $name, unit: $unit, description: $description}';
  }
}
