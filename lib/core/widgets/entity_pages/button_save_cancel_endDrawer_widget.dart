import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/flutter_flow/flutter_flow_widgets.dart';
import 'package:financeiro/core/providers/entities/crud_stack_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ButtonSaveCancelEndDrawerWidget extends StatelessWidget {
  const ButtonSaveCancelEndDrawerWidget({
    super.key,
    this.onSave,
    required this.tittle,
  });

  final dynamic Function()? onSave;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    final crudStackProvider = context.watch<CrudStackProvider>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 8, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      if (crudStackProvider.crudStack.length <= 1) {
                        Scaffold.of(context).closeEndDrawer();
                      } else {
                        crudStackProvider.popCrud();
                      }
                    },
                    text: 'X',
                    options: FFButtonOptions(
                      height: 40,
                      width: 40,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).error,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: Text(
                      tittle,
                      style: FlutterFlowTheme.of(context).displaySmall,
                    ),
                  ),
                ],
              ),
              FFButtonWidget(
                onPressed: () {
                  onSave?.call();
                  if (crudStackProvider.crudStack.length <= 1) {
                    Scaffold.of(context).closeEndDrawer();
                  } else {
                    crudStackProvider.popCrud();
                  }
                },
                text: 'Salvar',
                options: FFButtonOptions(
                  height: 40,
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 3,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
        Divider(
            //height: 12,
            thickness: 0.5,
            color: FlutterFlowTheme.of(context).accent2,
            indent: 6,
            endIndent: 6),
      ],
    );
  }
}
