import 'package:financeiro/map_dialog.dart';
import 'package:flutter/material.dart';
import 'package:financeiro/style.dart';

class CustomElegantCardMap extends StatefulWidget {
  final String tittle;
  final String? subTittle;
  final String? description;
  final String? imagePath;
  final String? onHoverImagePath;
  final IconData? icon;
  final IconData? onHoverIcon;
  final double lat;
  final double lng;

  const CustomElegantCardMap({
    super.key,
    required this.tittle,
    this.subTittle,
    this.icon,
    this.onHoverIcon,
    this.description,
    this.imagePath,
    this.onHoverImagePath,
    required this.lat,
    required this.lng,
  });

  @override
  State<CustomElegantCardMap> createState() => _CustomElegantCardMapState();
}

class _CustomElegantCardMapState extends State<CustomElegantCardMap> {
  IconData? iconToShow;
  String? imageToShow;
  bool? iconHover;

  @override
  void initState() {
    super.initState();

    iconToShow ??= widget.icon;
    imageToShow ??= widget.imagePath;
    iconHover ??= false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 240,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              color: StyleCustom.backgoundColor1,
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(top: 8),
            width: 232,
            height: 292,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(28)),
                color: StyleCustom.backgoundColor1,
                border: Border.all(
                    color: StyleCustom.iconBackgoundColor2, width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 44),
                      child: SizedBox(
                          height: 30,
                          width: 120,
                          child: Image.asset(
                            'images/underline2.png',
                            color: StyleCustom.iconBackgoundColor2,
                            filterQuality: FilterQuality.high,
                            isAntiAlias: true,
                          )),
                    ),
                    Text(
                      widget.tittle,
                      style: StyleCustom.subTittle,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Container(
                    width: 128,
                    height: 128,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: InkWell(
                        onTap: () {
                          final dialog = MapDialog(
                              tittle: widget.tittle,
                              description: widget.description,
                              lat: widget.lat,
                              lng: widget.lng);
                          if (widget.description != null) {
                            showDialog(
                                context: context, builder: (context) => dialog);
                          }
                        },
                        onHover: (value) {
                          iconHover = value;
                          if (value) {
                            iconToShow = (widget.onHoverIcon ?? widget.icon);
                            imageToShow =
                                (widget.onHoverImagePath ?? widget.imagePath);
                          } else {
                            iconToShow = widget.icon;
                            imageToShow = widget.imagePath;
                          }
                          setState(() {});
                        },
                        child: (iconToShow != null)
                            ? Icon(
                                iconToShow,
                                size: 128,
                                color: StyleCustom.iconColor,
                              )
                            : SizedBox(
                                height: 128,
                                width: 128,
                                child: Image.asset(
                                  imageToShow!,
                                  color: StyleCustom.iconColor,
                                  filterQuality: FilterQuality.high,
                                  isAntiAlias: true,
                                ))),
                  ),
                ),
                Text(
                  widget.subTittle ?? '',
                  textAlign: TextAlign.center,
                  style: StyleCustom.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
