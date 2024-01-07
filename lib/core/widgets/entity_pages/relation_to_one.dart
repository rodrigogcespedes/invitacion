import 'package:financeiro/flutter_flow/flutter_flow_icon_button.dart';
import 'package:financeiro/flutter_flow/flutter_flow_model.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/flutter_flow/form_field_controller.dart';
import 'package:financeiro/flutter_flow/flutter_flow_widgets.dart';
import 'package:financeiro/core/generics/generic_crud_widget.dart';
import 'package:financeiro/core/providers/entities/crud_stack_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RelationToOne extends StatelessWidget {
  const RelationToOne({
    super.key,
    required this.options,
    required this.controller,
    this.isSearchable,
    required this.onChanged,
    required this.defaultLabel,
    required this.label,
    this.newCrud,
    this.newModel,
  });
  final List<dynamic> options;
  final FormFieldController<String> controller;
  final bool? isSearchable;
  final dynamic Function(String?) onChanged;
  final String? label;
  final String defaultLabel;
  final GenericCrud? newCrud;
  final FlutterFlowModel? newModel;

  @override
  Widget build(BuildContext context) {
    final crudStackProvider = context.watch<CrudStackProvider>();

    return Row(
      children: [
        Expanded(
          child: /* FlutterFlowDropDown<String>(
            controller: controller,
            options: options,
            onChanged: onChanged,
            height: 52,
            textStyle: FlutterFlowTheme.of(context).bodySmall,
            hintText: label ?? defaultLabel,
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
          ), */
              DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).accent2, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).accent2, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
            ),
            
            dropdownColor: FlutterFlowTheme.of(context).primaryBackground,
            value: controller.value,
            onChanged: onChanged,
            items: options as List<DropdownMenuItem<String>>,
          ),
        ),
        if (newCrud != null)
          Row(
            children: [
              (label != null)
                  //!newCrud!.passedEntity!.isEmpty()
                  ? Row(
                      children: [
                        const VerticalDivider(width: 12, thickness: 0),
                        FlutterFlowIconButton(
                          onPressed: () {
                            crudStackProvider.setIsLoading(true);
                            crudStackProvider.pushCrud(newCrud!, newModel!);
                            crudStackProvider.setIsLoading(false);

                            if (crudStackProvider.crudStack.length <= 1) {
                              Scaffold.of(context).openEndDrawer();
                            }
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 24,
                          ),
                          fillColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 12,
                          buttonSize: 52,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const VerticalDivider(width: 12, thickness: 0),
                        FFButtonWidget(
                          onPressed: () {
                            crudStackProvider.setIsLoading(true);
                            crudStackProvider.pushCrud(newCrud!, newModel!);
                            crudStackProvider.setIsLoading(false);

                            if (crudStackProvider.crudStack.length <= 1) {
                              Scaffold.of(context).openEndDrawer();
                            }
                          },
                          text: 'Novo',
                          icon: const Icon(
                            Icons.add_rounded,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            height: 52,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 0, 16, 0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                ),
                            elevation: 3,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    )
            ],
          ),
      ],
    );
  }
}
