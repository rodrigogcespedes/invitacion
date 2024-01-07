import 'package:financeiro/core/providers/entities/generic_items_provider.dart';
import 'package:financeiro/core/widgets/entity_pages/drop_down_custom.dart';
import 'package:financeiro/core/widgets/entity_pages/filters/date_filter_controllers_pack.dart';
import 'package:financeiro/core/widgets/entity_pages/text_form_field_date_custom.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateFilter extends StatelessWidget {
  const DateFilter({
    super.key,
    required this.model,
    required this.fieldTitle,
  });
  final DateFilterControllersPack model;
  final String fieldTitle;

  @override
  Widget build(BuildContext context) {
    final genericItemsProvider = context.watch<GenericItemsProvider>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 4),
            child: Text(
              fieldTitle,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                  color: FlutterFlowTheme.of(context).primary),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 172.0,
                child: DropDownCustom(
                  options: const [
                    'Antes de',
                    'A partir de',
                    'Entre',
                    'Antes de hoje',
                    'A partir de hoje',
                  ],
                  controller: model.dropDownController!,
                  onChanged: (value) {
                    model.dropDownController!.value = value;
                    genericItemsProvider.refresh();
                  },
                ),
              ),
              if (model.dropDownController!.value != 'Antes de hoje' &&
                  model.dropDownController!.value != 'A partir de hoje')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: SizedBox(
                    width: 140.0,
                    child: TextFormFielDateCustom(
                        controller: model.date1Controller,
                        labelText: '',
                        firstDate: DateTime.utc(1920, 09, 13),
                        lastDate: DateTime.utc(2050, 09, 13)),
                  ),
                ),
              if (model.dropDownController!.value == 'Entre')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: SizedBox(
                    width: 140.0,
                    child: TextFormFielDateCustom(
                        controller: model.date2Controller,
                        labelText: '',
                        firstDate: DateTime.utc(1920, 09, 13),
                        lastDate: DateTime.utc(2050, 09, 13)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
