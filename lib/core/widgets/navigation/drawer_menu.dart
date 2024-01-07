import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/core/widgets/navigation/main_nav_widget.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: Drawer(
        elevation: 16.0,
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: const MainNavWidget(),
        ),
      ),
    );
  }
}
