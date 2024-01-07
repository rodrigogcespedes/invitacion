import 'package:financeiro/flutter_flow/flutter_flow_checkbox_group.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class CheckboxGroupCustom extends StatelessWidget {
  const CheckboxGroupCustom(
      {super.key,
      required this.options,
      required this.controller,
      required this.onChanged,
      this.optionGroupValues});
  final List<String> options;
  final FormFieldController<List<String>> controller;
  final void Function(List<String>)? onChanged;
  final List<String>? optionGroupValues;

  @override
  Widget build(BuildContext context) {
    return // Generated code for this CheckboxGroup Widget...
        FlutterFlowCheckboxGroup(
      options: options,
      onChanged: onChanged,
      controller: controller,
      activeColor: FlutterFlowTheme.of(context).primary,
      checkColor: Colors.white,
      checkboxBorderColor: FlutterFlowTheme.of(context).secondaryText,
      textStyle: FlutterFlowTheme.of(context).bodyMedium,
      itemPadding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
      checkboxBorderRadius: BorderRadius.circular(4),
      initialized: optionGroupValues != null,
    );
  }
}
