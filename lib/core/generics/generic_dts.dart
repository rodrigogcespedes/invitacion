import 'package:financeiro/core/providers/entities/generic_items_provider.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

abstract class GenericDTS extends DataTableSource {
  final BuildContext context;
  final GenericItemsProvider genericItemsProvider;
  final bool primary;
  bool? softDelete;
  List<String>? columnTitles;

  GenericDTS(
      this.context, this.genericItemsProvider, this.primary);

  static List<DataColumn> getDataColumns(
      BuildContext context, List<String> titles) {
    List<DataColumn> retornable = [];
    for (String title in titles) {
      retornable.add(GenericDTS.dataColumn(context, title));
    }

    return retornable;
  }

  static DataColumn dataColumn(BuildContext context, String title) {
    return DataColumn(
      label: Expanded(
        child: Text(
          title,
          textAlign: title != 'Ações' ? TextAlign.start : TextAlign.end,
          style: FlutterFlowTheme.of(context).bodySmall,
        ),
      ),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  List<DataRow> getDataRows() {
    List<DataRow> retornable = [];
    for (int index = 0; index < rowCount; index++) {
      retornable.add(getRow(index)!);
    }
    return retornable;
  }

  List<String> getColumnTitles();
}
