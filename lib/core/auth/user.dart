import 'package:financeiro/core/auth/role.dart';
import 'package:financeiro/core/auth/tenant.dart';
import 'package:financeiro/core/generics/base_entity.dart';

class User extends BaseEntity {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? resetPasswordToken;
  String? avatar;
  Role? role;
  Tenant? tenant;

  User({
    super.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.resetPasswordToken,
    this.avatar,
    this.role,
    this.tenant,
    super.tableName = 'users',
    super.tittle = 'Usuário',
  });

  @override
  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? resetPasswordToken,
    String? avatar,
    Role? role,
    Tenant? tenant,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
      tenant: tenant ?? this.tenant,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'resetPasswordToken': resetPasswordToken,
      'avatar': avatar,
      'role': role?.toMap(),
      'tenant': tenant?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      password: map['password'],
      resetPasswordToken: map['resetPasswordToken'],
      avatar: map['avatar'],
      role: map['role'] != null ? Role.fromMap(map['role']) : null,
      tenant: map['tenant'] != null ? Tenant.fromMap(map['tenant']) : null,
    );
  }

  @override
  List<String> getFields() {
    List<String> fields = [
      'id',
      'first_name',
      'last_name',
      'email',
      'password',
      'resetPasswordToken',
      'avatar',
    ];

    for (String e in Role().getFields()) {
      fields.add('role.$e');
    }

    for (String e in Tenant().getFields()) {
      fields.add('tenant.$e');
    }
    return fields;
  }

  @override
  void turnInto(BaseEntity received) {
    if (received is User) {
      firstName = received.firstName;
      lastName = received.lastName;
      email = received.email;
      password = received.password;
      resetPasswordToken = received.resetPasswordToken;
      avatar = received.avatar;
      role = received.role;
      tenant = received.tenant;
    }
  }
}
