import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/core/providers/entities/crud_stack_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrudEndDrawer extends StatelessWidget {
  const CrudEndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final crudStackProvider = context.watch<CrudStackProvider>();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        elevation: 16.0,
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: (crudStackProvider.isLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : crudStackProvider.crudStack.last,
        ),
      ),
    );
  }
}
