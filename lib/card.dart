//import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:financeiro/style.dart';

class CustomCard extends StatefulWidget {
  final String tittle;
  final String? subTittle;
  final String? description;
  final String? imagePath;
  final String? onHoverImagePath;
  final IconData? icon;
  final IconData? onHoverIcon;

  const CustomCard({
    super.key,
    required this.tittle,
    this.subTittle,
    this.icon,
    this.onHoverIcon,
    this.description,
    this.imagePath,
    this.onHoverImagePath,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
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
                          final dialog = Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.tittle,
                                  textAlign: TextAlign.center,
                                  style: StyleCustom.subTittle,
                                ),
                                if (widget.description != null)
                                  Text(
                                    widget.description!,
                                    textAlign: TextAlign.center,
                                    style: StyleCustom.body,
                                  ),
                              ],
                            ),
                          );
                          showDialog(
                              context: context, builder: (context) => dialog);
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
                                size: 52,
                                color: StyleCustom.iconColor,
                              )
                            : SizedBox(
                                height: 52,
                                width: 52,
                                child: Image.asset(
                                  imageToShow!,
                                  //colorBlendMode: BlendMode.darken,
                                  color: StyleCustom.iconColor,
                                  filterQuality: FilterQuality.high,
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
