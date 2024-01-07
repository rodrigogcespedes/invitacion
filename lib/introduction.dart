import 'package:financeiro/flutter_flow/flutter_flow_util.dart';
import 'package:financeiro/style.dart';
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop() {
      return responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ) &&
          (MediaQuery.of(context).size.height /
                  MediaQuery.of(context).size.width <=
              1);
    }

    //double scaleFactor = MediaQuery.of(context).size.height / 720;

    return Container(
      //Presentacion
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: StyleCustom.backgoundColor1,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 720,
            height: 720,
            child: Image.asset('images/Flores1.png',
                color: StyleCustom.backgoundColor2),
          ),
          Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* Divider(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.34,
                  thickness: 0,
                ), */
                Divider(
                  color: StyleCustom.iconBackgoundColor2,
                  height: 2,
                  thickness: 2,
                  indent: MediaQuery.of(context).size.width *
                      (isDesktop() ? 0.4 : 0.25),
                  endIndent: MediaQuery.of(context).size.width *
                      (isDesktop() ? 0.4 : 0.25),
                ),
                Padding(
                  padding: isDesktop()
                      ? const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 16)
                      : const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Te esperamos en el casamiento de',
                        textAlign: TextAlign.center,
                        style: StyleCustom.body.apply(fontSizeDelta: 8),
                      ),
                      Text(
                        'Fati & Rodri',
                        textAlign: TextAlign.center,
                        style: StyleCustom.tittle,
                      ),
                    ].divide(
                      const Divider(
                        color: Colors.transparent,
                        height: 8 ,
                        thickness: 0,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: StyleCustom.iconBackgoundColor2,
                  height: 2,
                  thickness: 2,
                  indent: MediaQuery.of(context).size.width *
                      (isDesktop() ? 0.4 : 0.25),
                  endIndent: MediaQuery.of(context).size.width *
                      (isDesktop() ? 0.4 : 0.25),
                ),
              ]),
        ],
      ),
    );
  }
}
