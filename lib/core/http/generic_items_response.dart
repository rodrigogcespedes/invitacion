import 'package:financeiro/core/generics/base_entity.dart';

class GenericItemsResponse {

  GenericItemsResponse();

  static List<BaseEntity>? fromMap2List(Map<String, dynamic> json,
      BaseEntity Function(Map<String, dynamic>) toEntityFunction) {
    return json["data"] == null
        ? []
        : List<BaseEntity>.from(
            json["data"].map(
              (x) => toEntityFunction(x),
            ),
          );
  }
}
