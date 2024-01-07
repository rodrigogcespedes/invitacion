import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:financeiro/core/navigation/menu_item.dart';

class CategoryMenu {
  String? name;
  IconData? icon;
  String? route;
  bool? visible;
  bool? selected;
  List<MenuItem>? menuItems;
  CategoryMenu({
    this.name,
    this.icon,
    this.route,
    this.visible,
    this.selected,
    this.menuItems,
  });

  CategoryMenu copyWith({
    String? name,
    IconData? icon,
    String? route,
    bool? visible,
    bool? selected,
    List<MenuItem>? menuItems,
  }) {
    return CategoryMenu(
      name: name ?? this.name ?? 'Sem nome',
      icon: icon ?? this.icon ?? Icons.home,
      route: route ?? this.route,
      visible: visible ?? this.visible ?? true,
      selected: selected ?? this.selected ?? false,
      menuItems: menuItems ?? this.menuItems ?? [],
    );
  }

  @override
  String toString() {
    return 'CategoryMenu(name: $name, icon: $icon, route: $route, visible: $visible, selected: $selected, menuItems: $menuItems)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryMenu &&
        other.name == name &&
        other.icon == icon &&
        other.route == route &&
        other.visible == visible &&
        other.selected == selected &&
        listEquals(other.menuItems, menuItems);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        icon.hashCode ^
        route.hashCode ^
        visible.hashCode ^
        selected.hashCode ^
        menuItems.hashCode;
  }
}
