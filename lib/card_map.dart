//import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/map_dialog.dart';
import 'package:flutter/material.dart';
import 'package:financeiro/style.dart';

class CustomCardMap extends StatefulWidget {
  final String tittle;
  final String? subTittle;
  final String? description;
  final IconData? icon;
  final IconData? onHoverIcon;
  final String? imagePath;
  final String? onHoverImagePath;
  final double lat;
  final double lng;

  const CustomCardMap({
    super.key,
    required this.tittle,
    this.subTittle,
    this.icon,
    this.onHoverIcon,
    this.description,
    required this.lat,
    required this.lng,
    this.imagePath,
    this.onHoverImagePath,
  });

  @override
  State<CustomCardMap> createState() => _CustomCardMapState();
}

class _CustomCardMapState extends State<CustomCardMap> {
  IconData? iconToShow;
  String? imageToShow;
  //bool? iconHover;

  @override
  void initState() {
    super.initState();

    iconToShow ??= widget.icon;
    imageToShow ??= widget.imagePath;
    //iconHover ??= false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsetsDirectional.only(top: 8),
        width: 240,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: StyleCustom.backgoundColor1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.tittle,
              style: StyleCustom.subTittle,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 28),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(36)),
                      color: StyleCustom.iconBackgoundColor2,
                    ),
                  ),
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(34)),
                      color: StyleCustom.iconBackgoundColor1,
                    ),
                    child: InkWell(
                        onTap: () {
                          final dialog = MapDialog(
                              tittle: widget.tittle,
                              description: widget.description,
                              lat: widget.lat,
                              lng: widget.lng);
                          showDialog(
                              context: context, builder: (context) => dialog);
                        },
                        onHover: (value) {
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
                                size: 52,
                                color: StyleCustom.iconColor,
                              )
                            : SizedBox(
                                height: 52,
                                width: 52,
                                child: Image.asset(
                                  imageToShow!,
                                  filterQuality: FilterQuality.high,
                                  color: StyleCustom.iconColor,
                                ))),
                  ),
                ],
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
    );
  }
}
