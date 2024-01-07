import 'package:financeiro/routes/route_utils.dart';
import 'package:flutter/material.dart';

class MenuItem {
  String? title;
  String? routeName;
  IconData? icon;
  String? page;
  String? pageName;
  bool? visible;
  bool? selected;
  Function? onTap;
  String? listTitle;
  String? subTitle;
  String? searchHint;
  String? collection;
  List<String>? initialFilters;
  List<String>? fields;
  List<Widget>? rowFields;
  String? toPathBottonNew;
  String? toPathBottonEdit;

  MenuItem({
    this.title,
    this.routeName,
    this.icon,
    this.page,
    this.pageName,
    this.visible,
    this.selected,
    this.onTap,
    this.listTitle,
    this.subTitle,
    this.searchHint,
    this.collection,
    this.initialFilters,
    this.fields,
    this.rowFields,
    this.toPathBottonNew,
    this.toPathBottonEdit,
  });

  MenuItem copyWith({
    String? title,
    String? routeName,
    IconData? icon,
    String? page,
    String? pageName,
    bool? visible,
    bool? selected,
    Function? onTap,
    String? listTitle,
    String? subTitle,
    String? searchHint,
    String? collection,
    List<String>? initialFilters,
    List<String>? fields,
    List<Widget>? rowFields,
    String? toPathBottonNew,
    String? toPathBottonEdit,
  }) {
    return MenuItem(
      title: title ?? this.title,
      routeName: routeName ?? this.routeName,
      icon: icon ?? this.icon ?? Icons.add_outlined,
      page: page ?? this.page ?? AppPage.homePage.toPath,
      pageName: pageName ?? this.pageName,
      visible: visible ?? this.visible ?? true,
      selected: selected ?? this.selected ?? false,
      onTap: onTap ?? this.onTap,
      listTitle: listTitle ?? this.listTitle,
      subTitle: subTitle ?? this.subTitle,
      searchHint: searchHint ?? this.searchHint,
      collection: collection ?? this.collection,
      initialFilters: initialFilters ?? this.initialFilters ?? [],
      fields: fields ?? this.fields ?? [],
      rowFields: rowFields ?? this.rowFields ?? [],
      toPathBottonNew: toPathBottonNew ?? this.toPathBottonNew ?? '',
      toPathBottonEdit: toPathBottonEdit ?? this.toPathBottonEdit ?? '',
    );
  }
}
