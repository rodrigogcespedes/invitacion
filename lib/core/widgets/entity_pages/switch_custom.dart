import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class SwitchCustom extends StatelessWidget {
  const SwitchCustom({
    super.key,
    this.label,
    this.onChanged,
    this.value,
  });
  final String? label;
  final void Function(bool)? onChanged;
  final bool? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: value ?? false,
          onChanged: onChanged,
          activeColor: FlutterFlowTheme.of(context).primary,
          inactiveTrackColor: FlutterFlowTheme.of(context).secondaryText,
        ),
        if (label != null)
          Text(
            label!,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
          ),
      ],
    );
  }
}
