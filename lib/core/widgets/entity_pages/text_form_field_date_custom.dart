import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/core/widgets/entity_pages/icon_date_picker_custom.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:financeiro/core/widgets/entity_pages/custom_date_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFormFielDateCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final int? minLines;
  final int? maxLines;
  final bool? obscureText;
  final bool? autofocus;
  final bool? datePicker;
  final DateTime firstDate;
  final DateTime lastDate;
  final bool? readOnly;
  final dynamic Function(String)? onChanged;
  final dynamic Function(PointerDownEvent)? onEditingComplete;

  const TextFormFielDateCustom({
    super.key,
    required this.controller,
    required this.labelText,
    this.minLines,
    this.maxLines,
    this.obscureText,
    this.autofocus,
    this.datePicker,
    required this.firstDate,
    required this.lastDate,
    this.onChanged,
    this.onEditingComplete,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      autofocus: autofocus ?? false,
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
      onTapOutside: onEditingComplete,
      inputFormatters: [
        MaskTextInputFormatter(
            mask: '##/##/####',
            filter: {"#": RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy),
      ],
      decoration: InputDecoration(
        suffixIcon: IconDatePickerCustom(
/*             initialDate: true
              ? DateFormat("dd/MM/yyyy").parse(controller.text)
              : firstDate, */
          firstDate: firstDate,
          lastDate: lastDate,
          controller: controller!,
        ),
        labelText: labelText,
        labelStyle: FlutterFlowTheme.of(context).bodySmall,
        hintStyle: FlutterFlowTheme.of(context).bodySmall,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).accent2,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).accent2,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
      ),
      style: FlutterFlowTheme.of(context).bodySmall.override(
            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
      cursorColor: FlutterFlowTheme.of(context).primary,
      validator: MultiValidator([
        RequiredValidator(errorText: 'Data deve ser preenchida'),
        DateValidator('dd/MM/yyyy',
            errorText: 'Data deve ser preenchida'),
        CustomDateValidator(
            //THIS ONE MUST ALWAYS BE THE LAST ONE
            startDate: firstDate,
            endDate: lastDate,
            errorText: 'Data não é válida'),
      ]).call,
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
