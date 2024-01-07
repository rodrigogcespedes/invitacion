import 'package:financeiro/flutter_flow/flutter_flow_drop_down.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class DropDownCustom extends StatelessWidget {
  const DropDownCustom({
    super.key,
    required this.options,
    required this.controller,
    this.isSearchable,
    required this.onChanged,
    this.tittle,
    this.width,
    this.height,
  });
  final List<String> options;
  final FormFieldController<String> controller;
  final bool? isSearchable;
  final String? tittle;
  final double? width;
  final double? height;
  final dynamic Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<String>(
      controller: controller,
      options: options,
      onChanged: onChanged,
      width: width ?? double.infinity,
      height: height ?? 48,
      textStyle: FlutterFlowTheme.of(context).bodySmall,
      hintText: tittle == null ? 'Selecione' : 'Selecione $tittle',
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 15,
      ),
      fillColor: FlutterFlowTheme.of(context).primaryBackground,
      elevation: 2,
      borderColor: FlutterFlowTheme.of(context).accent2,
      borderWidth: 2,
      borderRadius: 12,
      margin: const EdgeInsetsDirectional.fromSTEB(20, 4, 12, 4),
      hidesUnderline: true,
      isSearchable: isSearchable ?? false,
    );
  }
}
