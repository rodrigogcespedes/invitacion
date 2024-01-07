import 'package:financeiro/core/generics/base_entity.dart';

class GenericItemResponse {

  GenericItemResponse();

  static BaseEntity? fromMap2Entity(Map<String, dynamic> json,
      BaseEntity Function(Map<String, dynamic>) toEntityFunction) {
    return json["data"] == null ? null : toEntityFunction(json["data"]);
  }
  
}
