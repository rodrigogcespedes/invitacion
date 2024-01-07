import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/error.png', width: 350),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Página não encontrada!',
                style: FlutterFlowTheme.of(context).displaySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
