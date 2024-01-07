import 'package:financeiro/core/generics/base_entity.dart';

abstract class BaseTreeEntity extends BaseEntity {
  BaseTreeEntity? parent;

  BaseTreeEntity({
    super.id,
    required super.tableName,
    required super.tittle,
    this.parent,
  });

  @override
  BaseEntity copyWith({String? id, BaseTreeEntity? parent});

  String getTreeEntryText();

  BaseTreeEntity getEmptyObject();

  BaseTreeEntity getChildPreset();
}
