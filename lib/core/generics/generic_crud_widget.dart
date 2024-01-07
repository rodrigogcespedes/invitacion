import 'package:financeiro/core/generics/base_entity.dart';
import 'package:flutter/material.dart';

abstract class GenericCrud extends StatefulWidget {
  final bool isPrimary;
  final bool? isToOne;
  final String id;
  final BaseEntity? passedEntity;
  final List<BaseEntity>? passedEntitys;

  const GenericCrud({
    super.key,
    required this.isPrimary,
    required this.id,
    this.passedEntity,
    this.passedEntitys,
    this.isToOne,
  });

  GenericCrud copyWith({
    bool? isPrimary,
    bool? isToOne,
    String? id,
    BaseEntity? passedEntity,
    List<BaseEntity>? passedEntitys,
  });
}
