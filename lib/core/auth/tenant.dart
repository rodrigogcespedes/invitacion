import 'package:financeiro/core/generics/base_entity.dart';

class Tenant extends BaseEntity {
  String? name;

  Tenant({
    super.id,
    this.name,
    super.tableName = 'tenant',
    super.tittle = 'Tenant',
  });

  @override
  Tenant copyWith({
    String? id,
    String? name,
  }) {
    return Tenant(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Tenant.fromMap(Map<String, dynamic> map) {
    return Tenant(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  List<String> getFields() {
    List<String> fields = ['id', 'name'];
    return fields;
  }

  @override
  void turnInto(BaseEntity received) {
    if (received is Tenant) {
      name = received.name;
    }
  }
}
