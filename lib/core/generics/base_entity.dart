import 'dart:convert';

abstract class BaseEntity {
  String? id;
  String tableName;
  String tittle;

  Map<String, dynamic> toMap();

  void turnInto(BaseEntity received);

  BaseEntity copyWith({String? id});

  List<String> getFields();

  String toJson() => json.encode(toMap());

  bool isEmpty() {
    bool response = true;
    Map<String, dynamic>? entityMap = toMap();

    entityMap.forEach((key, value) {
      if (value != null) response = false;
    });
    return response;
  }

  @override
  String toString() {
    String mapString = jsonEncode(toMap());
    mapString = mapString
        .replaceAll(',', ',\n')
        .replaceFirst('{', '')
        .replaceAll('{', '\n{\n')
        .replaceAll('}', '\n}\n')
        .replaceAll('[', '\n[\n')
        .replaceAll(']', '\n]\n');

    mapString = mapString.substring(0, mapString.length - 2);
    return 'Instance of {$tableName}: {$mapString}';
  }

  BaseEntity({
    this.id,
    required this.tableName,
    required this.tittle,
  });
}
