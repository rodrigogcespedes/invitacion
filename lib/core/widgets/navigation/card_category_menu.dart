import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/core/navigation/category_menu.dart';
import 'package:financeiro/core/widgets/navigation/card_menu_item.dart';
import 'package:financeiro/core/providers/navigation/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardCategoryMenu extends StatelessWidget {
  const CardCategoryMenu({
    super.key,
    required this.category,
  });
  final CategoryMenu category;

  @override
  Widget build(BuildContext context) {
    final nativationProvider = context.watch<NavigationProvider>();
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (category.name ?? '').toUpperCase(),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                child: IconButton(
                  onPressed: () =>
                      nativationProvider.setSelectedCategory(category),
                  icon: Icon(
                    (category.selected == false)
                        ? Icons.expand_more
                        : Icons.expand_less,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 28,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              )
            ],
          ),
          if (category.selected == true)
            if (category.menuItems != null &&
                (category.menuItems ?? []).isNotEmpty)
              ...List.generate((category.menuItems!.length), (index) {
                final itemMenuItem = category.menuItems![index];
                return CardItemMenu(
                  menuItem: itemMenuItem,
                );
              }),
        ],
      ),
    );
  }
}
