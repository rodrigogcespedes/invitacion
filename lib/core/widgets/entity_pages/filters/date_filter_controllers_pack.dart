import 'package:financeiro/flutter_flow/flutter_flow_util.dart';
import 'package:financeiro/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class DateFilterControllersPack extends FlutterFlowModel {
  FormFieldController<String>? dropDownController;
  TextEditingController? date1Controller;
  TextEditingController? date2Controller;

  void initDateFilter() {
    dropDownController = FormFieldController('Entre');
    date1Controller = TextEditingController();
    date2Controller = TextEditingController();
  }

  String getFilter(String fieldName) {
    switch (dropDownController!.value) {
      case 'Antes de':
        return date1Controller.text != ''
            ? '&filter[$fieldName][_lt]=${DateFormat("yyyy-MM-dd").format(DateFormat('dd/MM/yyyy').parse(date1Controller.text))}'
            : '';
      case 'A partir de':
        return date1Controller.text != ''
            ? '&filter[$fieldName][_gte]=${DateFormat("yyyy-MM-dd").format(DateFormat('dd/MM/yyyy').parse(date1Controller.text))}'
            : '';
      case 'Entre':
        return (date1Controller.text != '') && (date2Controller.text != '')
            ? '&filter[$fieldName][_gte]=${DateFormat("yyyy-MM-dd").format(DateFormat('dd/MM/yyyy').parse(date1Controller.text))}&filter[$fieldName][_lt]=${DateFormat("yyyy-MM-dd").format(DateFormat('dd/MM/yyyy').parse(date2Controller.text))}'
            : '';
      case 'Antes de hoje':
        return '&filter[$fieldName][_lt]=\$NOW';
      case 'A partir de hoje':
        return '&filter[$fieldName][_gte]=\$NOW';
      default:
        return '&filter[$fieldName][_eq]=\$NOW';
    }
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dropDownController?.dispose();
    date1Controller?.dispose();
    date1Controller?.dispose();
  }
}
