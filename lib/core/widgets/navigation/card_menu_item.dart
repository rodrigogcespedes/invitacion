import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/core/navigation/menu_item.dart';
import 'package:financeiro/core/widgets/navigation/on_over_text.dart';
import 'package:financeiro/core/providers/navigation/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardItemMenu extends StatelessWidget {
  const CardItemMenu({
    super.key,
    required this.menuItem,
  });
  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final nativationProvider = context.watch<NavigationProvider>();
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          nativationProvider.setMenuItem(menuItem);
          context.go(menuItem.page!);
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: Icon(
                  menuItem.icon,
                  size: 24.0,
                ),
              ),
            ),
            OnHoverText(
              builder: (bool isHovered) => Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  menuItem.title ?? '',
                  style: nativationProvider.selectedMenuItem == menuItem
                      ? FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          )
                      : FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
