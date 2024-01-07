import 'package:financeiro/style.dart';
import 'package:flutter/material.dart';
import 'package:financeiro/fotos/fotos_dialog.dart';
import 'dart:math' as math;

class FotosDesktop extends StatelessWidget {
  const FotosDesktop({
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
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Stack(
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(-1 * math.pi / 8),
                    child: Container(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 20),
                      color: Colors.white,
                      height: 214,
                      width: 200,
                      child: Image.asset(
                        'images/foto1-grupo1.png',
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(math.pi / 9),
                      child: Container(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 20),
                          color: Colors.white,
                          height: 214,
                          width: 200,
                          child: Image.asset(
                            'images/foto1-grupo2.png',
                            isAntiAlias: true,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(80, 160, 0, 0),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(math.pi / -30),
                      child: Container(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 20),
                          color: Colors.white,
                          height: 214,
                          width: 200,
                          child: Image.asset(
                            'images/foto1-grupo2.png',
                            isAntiAlias: true,
                          )),
                    ),
                  )
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                    /* height: 560,
                    width: 420, */
                    height: 400,
                    width: 400,
                    child: Image.asset(
                      'images/Flores4.png',
                      scale: 0.85,
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
                          fontSizeDelta: 16,
                        )),
                    const FotosDialog(),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: Transform(
                      transform: Matrix4.rotationZ(math.pi / -18),
                      alignment: Alignment.center,
                      child: Container(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 20),
                        color: Colors.white,
                        height: 214,
                        width: 200,
                        child: Image.asset(
                          'images/foto1-grupo2.png',
                          isAntiAlias: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(130, 100, 0, 0),
                    child: Transform(
                      transform: Matrix4.rotationZ(math.pi / 6),
                      alignment: Alignment.center,
                      child: Container(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 20),
                        color: Colors.white,
                        height: 214,
                        width: 200,
                        child: Image.asset(
                          'images/foto1-grupo1.png',
                          isAntiAlias: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 180, 0, 0),
                    child: Transform(
                      transform: Matrix4.rotationZ(math.pi * 0),
                      alignment: Alignment.center,
                      child: Container(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 20),
                        color: Colors.white,
                        height: 214,
                        width: 200,
                        child: Image.asset(
                          'images/foto1-grupo1.png',
                          isAntiAlias: true,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
