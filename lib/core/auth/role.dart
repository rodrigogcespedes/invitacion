import 'package:financeiro/core/generics/base_entity.dart';

class Role extends BaseEntity {
  String? name;
  String? description;
  bool? adminAccess;

  Role({
    super.id,
    this.name,
    this.description,
    this.adminAccess,
    super.tableName = 'roles',
    super.tittle = 'Rol',
  });

  @override
  Role copyWith({
    String? id,
    String? name,
    String? description,
    bool? adminAccess,
  }) {
    return Role(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      adminAccess: adminAccess ?? this.adminAccess,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'admin_access': adminAccess,
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      adminAccess: map['admin_access'],
    );
  }

  @override
  List<String> getFields() {
    List<String> fields = [
      'id',
      'name',
      'description',
      'admin_access',
    ];

    return fields;
  }

  @override
  void turnInto(BaseEntity received) {
    if (received is Role) {
      name = received.name;
      description = received.description;
      adminAccess = received.adminAccess;
    }
  }
}
