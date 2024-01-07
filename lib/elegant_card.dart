import 'package:flutter/material.dart';
import 'package:financeiro/style.dart';
import 'package:animate_do/animate_do.dart';

class CustomElegantCard extends StatefulWidget {
  final String tittle;
  final String? subTittle;
  final String? description;
  final String? imagePath;
  final String? onHoverImagePath;
  final IconData? icon;
  final IconData? onHoverIcon;

  const CustomElegantCard({
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
  State<CustomElegantCard> createState() => _CustomElegantCardState();
}

class _CustomElegantCardState extends State<CustomElegantCard> {
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
