import 'package:financeiro/flutter_flow/flutter_flow_model.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/flutter_flow/flutter_flow_widgets.dart';
import 'package:financeiro/core/generics/generic_crud_widget.dart';
import 'package:financeiro/core/navigation/menu_item.dart';
import 'package:financeiro/core/providers/entities/crud_stack_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ButtonAddWidget extends StatelessWidget {
  const ButtonAddWidget({
    super.key,
    required this.selectedMenuItem,
    required this.primary,
    this.crud,
    this.model,
  });

  final MenuItem? selectedMenuItem;
  final bool primary;
  final GenericCrud? crud;
  final FlutterFlowModel? model;

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        if (primary) {
          context.go(selectedMenuItem!.toPathBottonNew!);
        } else {
          final crudStackProvider = context.read<CrudStackProvider>();
          crudStackProvider.setIsLoading(true);
          crudStackProvider.pushCrud(crud!, model!);
          crudStackProvider.setIsLoading(false);
          Scaffold.of(context).openEndDrawer();
        }
      },
      text: 'Novo',
      icon: const Icon(
        Icons.add_rounded,
        size: 15,
      ),
      options: FFButtonOptions(
        height: 40,
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color: Colors.white,
            ),
        elevation: 3,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
