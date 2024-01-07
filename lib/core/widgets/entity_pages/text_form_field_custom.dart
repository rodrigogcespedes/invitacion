import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    super.key,
    this.controller,
    required this.labelText,
    this.validator,
    this.minLines,
    this.maxLines,
    this.obscureText,
    this.autofocus,
    this.datePicker,
    this.onChanged,
    this.initialValue,
    this.readOnly,
  });
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;
  final bool? obscureText;
  final bool? autofocus;
  final bool? datePicker;
  final bool? readOnly;
  final Function(String)? onChanged;
  final String? initialValue;

  static String? requiredValidator(String? input) {
    if (input == '') return 'Esse campo deve ser preenchido';
    return null;
  }

  static String? numericValidator(String? input) {
    final numericRegex = RegExp(r'^([0-9]*)$');
    if (!numericRegex.hasMatch(input ?? '')) {
      return 'Esse campo só pode conter números';
    }
    return null;
  }

  static String? decimalValidator(String? input) {
    final numericRegex = RegExp(r'^(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    if (!numericRegex.hasMatch(input ?? '')) {
      return 'Esse campo só pode conter números y "."';
    }
    return null;
  }

  static String? alphabeticValidator(String? input) {
    final numericRegex = RegExp(r'^[A-Za-z_., -]+$');
    if (!numericRegex.hasMatch(input ?? '')) {
      return 'Esse campo só pode conter caracteres do alfabeto';
    }
    return null;
  }

  static String? asciiValidator(String? input) {
    final numericRegex = RegExp(r'^[\x00-\x7F\u00B5-\u00FF]+$');
    if (!numericRegex.hasMatch(input ?? '')) {
      return 'Esse campo não pode conter caracteres unicode';
    }
    return null;
  }

  static String? dayValidator(String? input) {
    final numericRegex = RegExp(r'^((([1-9]|(1[0-9]))|(2[0-9]))|(3[0-1]))$');
    if (!numericRegex.hasMatch(input ?? '')) {
      return 'Esse campo só pode conter números de 1 a 31';
    }
    return null;
  }

  static String? requiredAlphabeticValidator(String? input) {
    return requiredValidator(input) ?? alphabeticValidator(input);
  }

  static String? requiredAsciiValidator(String? input) {
    return requiredValidator(input) ?? asciiValidator(input);
  }

  static String? requiredNumericValidator(String? input) {
    return requiredValidator(input) ?? numericValidator(input);
  }

  static String? requiredDecimalValidator(String? input) {
    return requiredValidator(input) ?? decimalValidator(input);
  }

  static String? requiredDayValidator(String? input) {
    return requiredValidator(input) ?? dayValidator(input);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      autofocus: autofocus ?? false,
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        labelText:
            '$labelText${(readOnly ?? false) ? ' (campo a ser preenchido automaticamente)' : ''}',
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
      validator: validator,
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
