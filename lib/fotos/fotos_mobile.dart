import 'package:financeiro/flutter_flow/flutter_flow_util.dart';
import 'package:financeiro/style.dart';
import 'package:flutter/material.dart';
import 'package:financeiro/fotos/fotos_dialog.dart';
import 'dart:math' as math;

class FotosMobile extends StatelessWidget {
  const FotosMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        //Fotos
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: StyleCustom.backgoundColor1,
        ),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                    height: 400,
                    width: 300,
                    child: Image.asset(
                      'images/Flores3.png',
                      color: StyleCustom.backgoundColor2,
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Traé tu Foto',
                        textAlign: TextAlign.center,
                        style: StyleCustom.tittle.apply(
                          fontSizeDelta: -24,
                        )),
                    const FotosDialog(),
                  ],
                ),
              ],
            ), */
            Text('Traé tu Foto',
                textAlign: TextAlign.center,
                style: StyleCustom.tittle.apply(
                  fontSizeDelta: -24,
                )),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                      height: 400,
                      width: 300,
                      child: Image.asset(
                        'images/Flores3.png',
                        color: StyleCustom.backgoundColor2,
                        filterQuality: FilterQuality.high,
                        isAntiAlias: true,
                      )),
                  Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Transform(
                          transform: Matrix4.rotationZ(math.pi / -18),
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6, 6, 6, 20),
                            color: Colors.white,
                            height: 114,
                            width: 100,
                            child: Image.asset(
                              'images/foto1-grupo2.png',
                              isAntiAlias: true,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(70, 58, 0, 0),
                        child: Transform(
                          transform: Matrix4.rotationZ(math.pi / 6),
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6, 6, 6, 20),
                            color: Colors.white,
                            height: 114,
                            width: 100,
                            child: Image.asset(
                              'images/foto1-grupo1.png',
                              isAntiAlias: true,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                        child: Transform(
                          transform: Matrix4.rotationZ(math.pi * 0),
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6, 6, 6, 20),
                            color: Colors.white,
                            height: 114,
                            width: 100,
                            child: Image.asset(
                              'images/foto1-grupo1.png',
                              isAntiAlias: true,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(70, 130, 0, 0),
                        child: Transform(
                          transform: Matrix4.rotationZ(math.pi / 22),
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6, 6, 6, 20),
                            color: Colors.white,
                            height: 114,
                            width: 100,
                            child: Image.asset(
                              'images/foto1-grupo1.png',
                              isAntiAlias: true,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 148, 0, 0),
                        child: Transform(
                          transform: Matrix4.rotationZ(math.pi / -18),
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6, 6, 6, 20),
                            color: Colors.white,
                            height: 114,
                            width: 100,
                            child: Image.asset(
                              'images/foto1-grupo2.png',
                              isAntiAlias: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const FotosDialog(),
                ],
              ),
            ),
          ]/* .divide(const Divider(
            height: 8,
            thickness: 0,
            color: Colors.transparent,
          )) */,
        ));
  }
}
