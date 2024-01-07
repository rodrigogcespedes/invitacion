import 'package:financeiro/core/providers/entities/generic_items_provider.dart';
import 'package:financeiro/core/widgets/entity_pages/checkbox_group_custom.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionFilter extends StatelessWidget {
  const SelectionFilter({
    super.key,
    required this.fieldTitle,
    required this.optionGroupValues,
    required this.optionGroupController,
  });
  final List<String> optionGroupValues;
  final FormFieldController<List<String>> optionGroupController;
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
          SizedBox(
            width: 240,
            child: CheckboxGroupCustom(
                options: optionGroupValues,
                controller: optionGroupController,
                onChanged: (value) {
                  optionGroupController.value = value;
                  genericItemsProvider.refresh();
                }),
          ),
        ],
      ),
    );
  }
}
