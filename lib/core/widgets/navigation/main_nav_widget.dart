import 'package:financeiro/core/providers/auth/auth_provider.dart';
import 'package:financeiro/core/widgets/entity_pages/square_tumbnail.dart';
import 'package:financeiro/core/widgets/navigation/botton_dark_light.dart';
import 'package:financeiro/core/widgets/navigation/card_category_menu.dart';
import 'package:financeiro/core/providers/navigation/navigation_provider.dart';
import 'package:financeiro/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';

import 'package:flutter/material.dart';

class MainNavWidget extends StatefulWidget {
  const MainNavWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MainNavWidget> createState() => _MainNavWidgetState();
}

class _MainNavWidgetState extends State<MainNavWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final categories = NavigationProvider.categories
        .where((element) => element.visible == true)
        .toList();
    return Container(
      width: 240.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            color: FlutterFlowTheme.of(context).lineColor,
            offset: const Offset(1.0, 0.0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const LogoWidget(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, int index) {
                  final category = categories[index];
                  category.menuItems = category.menuItems
                      ?.where((element) => element.visible == true)
                      .toList();
                  return CardCategoryMenu(
                    category: category,
                  );
                },
              ),
            ),
            const BottomDarkLight(),
          ],
        ),
      ),
    );
  }
}

/* class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SquareTumbnailWidget(
            imageURL:
                '${dotenv.env['HOST_DIRECTUS'].toString()}assets/${authProvider.user?.currentCostCenter?.logo ?? '13e4a89a-792d-4ccf-8d24-cb523c821112'}?quality=20',
            size: 40),
        Flexible(
          child: Text(
            authProvider.user?.currentCostCenter?.shortName ?? 'Banzai',
            style: FlutterFlowTheme.of(context).headlineMedium,
            maxLines: 3,
          ),
        ),
      ].divide(const VerticalDivider(
        thickness: 0,
        width: 12,
        color: Colors.transparent,
      )),
    );
  }
} */
