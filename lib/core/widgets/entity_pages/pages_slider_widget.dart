import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart';

class PagesWidgetSlider extends StatelessWidget {
  const PagesWidgetSlider({
    super.key,
    required this.rowsPerPage,
    required this.collectionName,
    required this.currentPage,
    required this.textFilterController,
    required this.nextPage,
    required this.previousPage,
    required this.totalItems,
  });

  final TextEditingController? textFilterController;
  final String collectionName;
  final int rowsPerPage;
  final int currentPage;
  final int totalItems;
  final dynamic Function()? nextPage;
  final dynamic Function()? previousPage;

  @override
  Widget build(BuildContext context) {
    final lastPage =
        (totalItems / rowsPerPage).ceil().toInt();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Página ${currentPage.toString()} de ${lastPage.toString()}',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
              Text(
                '$totalItems itens encontrados',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText),
              ),
            ],
          ),
          const VerticalDivider(
            width: 16,
            color: Colors.transparent,
          ),
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).lineColor,
            borderRadius: 12.0,
            borderWidth: 1.0,
            buttonSize: 48.0,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            icon: Icon(
              Icons.navigate_before_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            onPressed: previousPage,
          ),
          const VerticalDivider(
            width: 16,
            color: Colors.transparent,
          ),
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).lineColor,
            borderRadius: 12.0,
            borderWidth: 1.0,
            buttonSize: 48.0,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            icon: Icon(
              Icons.navigate_next_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            onPressed: nextPage,
          ),
        ],
      ),
    );
  }
}
