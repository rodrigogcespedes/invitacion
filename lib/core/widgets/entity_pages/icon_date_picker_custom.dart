import 'package:financeiro/flutter_flow/flutter_flow_icon_button.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';


class IconDatePickerCustom extends StatelessWidget {
  const IconDatePickerCustom({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.controller,
  });

  final DateTime firstDate;
  final DateTime lastDate;
  final TextEditingController controller;
  //final DateTime initialDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
      child: FlutterFlowIconButton(
        borderColor: Colors.transparent,
        borderRadius: 12,
        borderWidth: 1,
        buttonSize: 32,
        icon: Icon(
          Icons.calendar_month,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 18,
        ),
        onPressed: () async {
          final DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: firstDate,
            firstDate: firstDate,
            lastDate: lastDate,
            locale: const Locale('pt', 'BR'),
          );
          if (newDate != null) {
            controller.text = DateFormat.yMd("pt_BR").format(newDate);
          }
        },
      ),
    );
  }
}
