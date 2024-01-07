import 'package:flutter/material.dart';

abstract class GenericFilter extends StatefulWidget {
  final List<String>? filters;
  final String? basicFilter;

  const GenericFilter({
    super.key,
    this.filters,
    this.basicFilter,
  });

  GenericFilter setAtributtes({List<String>? filters, String? basicFilter});
}
