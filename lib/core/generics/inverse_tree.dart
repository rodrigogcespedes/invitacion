import 'package:financeiro/core/generics/base_tree_entity.dart';

class InverseTree<T extends BaseTreeEntity> {
  T node;

  bool shiny;

  bool selected; //If the checkbox is selected

  List<InverseTree<T>>? children;

  InverseTree(
      {required this.node,
      this.children,
      this.shiny = false,
      this.selected = false});

  static List<InverseTree<E>> revertAnyToOneRelation<E extends BaseTreeEntity>(
      {required List<E> entities}) {
    List<InverseTree<E>> roots = [];

    for (E entity in entities) {
      if (entity.parent!.isEmpty()) {
        roots.add(InverseTree<E>(node: entity, children: []));
      }
    }

    for (InverseTree<E> root in roots) {
      root.children = InverseTree.findChildren<E>(entities, root.node);
    }
    return roots;
  }

  static List<InverseTree<E>> findChildren<E extends BaseTreeEntity>(
      List<E> entities, E parent) {
    List<InverseTree<E>> children = [];
    List<E> childrenEntities = [];

    childrenEntities.addAll(entities
        .where((element) => (element.parent?.id ?? '') == parent.id)
        .toList());

    for (E entity in childrenEntities) {
      List<InverseTree<E>> subChildren =
          InverseTree.findChildren<E>(entities, entity);

      children.add(InverseTree<E>(node: entity, children: subChildren));
    }

    return children;
  }

  void lookForShiny(String filter) {
    if (getValues().toLowerCase().contains(filter.toLowerCase())) shiny = true;
    for (InverseTree<T> child in children ?? []) {
      child.lookForShiny(filter);
    }
  }

  void cascadeShiny(bool value) {
    shiny = value;
    for (InverseTree<T> child in children ?? []) {
      child.cascadeShiny(value);
    }
  }

  void cascadeSelected(bool value) {
    selected = value;
    for (InverseTree<T> child in children ?? []) {
      child.cascadeSelected(value);
    }
  }

  @override
  String toString() {
    String retornable = this.node.toString();

    for (InverseTree<T> child in (this.children ?? [])) {
      retornable = '$retornable\n\t ${child.toString()}';
    }

    return retornable;
  }

  String getValues() {
    T aux = this
        .node
        .copyWith(id: ' ', parent: this.node.parent?.getEmptyObject()) as T;
    String retornable = aux.toString();
    List<String> fields = aux.getFields().map((e) => e).toList();
    fields.add('parent');

    Match typeTitle = '{'.allMatches(retornable).elementAt(1);
    retornable = retornable.substring(typeTitle.end);

    for (String field in fields) {
      Iterable<Match> result = '"$field":'.allMatches(retornable);
      for (Match match in result) {
        match = '"$field":'.allMatches(retornable).first;
        retornable = retornable.replaceRange(match.start, match.end, '');
      }
    }
    return retornable;
  }
}
