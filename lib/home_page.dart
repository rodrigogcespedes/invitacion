import 'package:financeiro/core/widgets/navigation/drawer_menu.dart';
import 'package:financeiro/style.dart';
import 'package:financeiro/introduction.dart';
import 'package:financeiro/countDown.dart';
import 'package:financeiro/elegant_card.dart';
import 'package:financeiro/elegant_card_map.dart';
import 'package:financeiro/fotos/fotos_desktop.dart';
import 'package:financeiro/fotos/fotos_mobile.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.pageView});
  final Widget? pageView;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime deadLine = DateTime.utc(2024, DateTime.may, 24, 18);

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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: StyleCustom.backgoundColor2,
        drawer: const DrawerMenu(),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Introduction(),
                              Container(
                                //Contador
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: StyleCustom.backgoundColor2,
                                ),
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 185,
                                      decoration: BoxDecoration(
                                          color: StyleCustom.backgoundColor1,
                                          border: BorderDirectional(
                                              bottom: BorderSide(
                                                  color: StyleCustom
                                                      .iconBackgoundColor2,
                                                  width: 2))),
                                    ),
                                    CountDown(deadLine: deadLine),
                                  ],
                                ),
                              ),
                              Container(
                                //Cards
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: StyleCustom.backgoundColor2,
                                ),
                                child: const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 40, 8, 20),
                                  child: Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        CustomElegantCard(
                                          tittle: 'Día',
                                          imagePath: 'images/calendar.png',
                                          /* onHoverIcon:
                                              Icons.edit_calendar_outlined, */
                                          subTittle: 'Viernes 24 de Mayo',
                                        ),
                                        CustomElegantCardMap(
                                          tittle: 'Ceremonia',
                                          imagePath: 'images/rings.png',
                                          onHoverImagePath: 'images/pin.png',
                                          subTittle:
                                              'Inmaculada Concepción 18:00',
                                          description:
                                              'Parroquia Inmaculada Concepción, Colón 143, Palmira',
                                          lat: -33.050121,
                                          lng: -68.560217,
                                        ),
                                        CustomElegantCardMap(
                                          tittle: 'Cena',
                                          imagePath: 'images/cheers.png',
                                          onHoverImagePath: 'images/pin.png',
                                          subTittle: 'Café de la Patria 21:00',
                                          description:
                                              'Café de la Patria, 25 de Mayo 44, San Martín',
                                          lat: -33.08429884751032,
                                          lng: -68.47314498825408,
                                        ),
                                        CustomElegantCard(
                                          tittle: 'Vestimen',
                                          imagePath: 'images/bow_tie.png',
                                          onHoverImagePath: 'images/pearls.png',
                                          subTittle: 'Formal',
                                        ),
                                        CustomElegantCard(
                                          tittle: 'Regalos',
                                          imagePath: 'images/gift.png',
                                          onHoverImagePath:
                                              'images/bow_tie.png',
                                          subTittle: '???',
                                        ),
                                      ]),
                                ),
                              ),
                              (isDesktop())
                                  ? const FotosDesktop()
                                  : const FotosMobile(),
                              Container(
                                //Footer
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height /
                                    (isDesktop() ? 3 : 6),
                                decoration: BoxDecoration(
                                  color: StyleCustom.backgoundColor2,
                                ),
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('Fati & Rodri',
                                          textAlign: TextAlign.center,
                                          style: StyleCustom.tittle.apply(
                                            color: Colors.white,
                                            fontSizeFactor: 0,
                                            fontSizeDelta:
                                                isDesktop() ? 80 : 40,
                                          )),
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
