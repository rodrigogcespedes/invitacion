import 'package:financeiro/style.dart';
import 'package:flutter/material.dart';

class FotosDialog extends StatelessWidget {
  const FotosDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(
                Radius.circular(34)),
        color: StyleCustom
            .iconBackgoundColor1,
      ),
      child: InkWell(
          onTap: () {
            final dialog = Dialog(
              child:
                  SingleChildScrollView(
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min,
                  mainAxisAlignment:
                      MainAxisAlignment
                          .start,
                  children: [
                    Text(
                      '¡Traé tu Foto!',
                      textAlign: TextAlign
                          .center,
                      style: StyleCustom
                          .subTittle,
                    ),
                    Text(
                      '''
        ¿Qué es lo que hay que hacer?
        Traés una foto en la que salgas con los novios a la cena y las ponemos en un mural para enseñar los momentos que pasaste con ellos.
        
        ¿Pero qué hago si no tengo una foto con los dos novios?
        No hay drama, podés traer una en la que salgas con uno de ellos.
        
        ¿Y si sale alguien más en la foto?
        ¡Buenísimo! Se va a ver genial en el mural.
        
        ¿Tiene que ser de un tamaño en particular?
        Puede ser de cualquier tamaño y forma, es más, ni siquiera hace falta que la traigas en papel fotográfico, puede ser un papel impreso e igual va a quedar genial ¡Cualquier foto sirve!
        
        Tengo una, pero es viejísima.
        ¡Mejor! Entre más variadas más divertido va a quedar el mural al final.
        
        Tengo dudas y no estoy seguro de qué foto llevar.
        Si tenés muchas fotos con los novios y no podés decidirte por una ¡Podés traerlas todas!
        ''',
                      textAlign: TextAlign
                          .center,
                      style: StyleCustom
                          .body,
                    ),
                  ],
                ),
              ),
            );
            showDialog(
                context: context,
                builder: (context) =>
                    dialog);
          },
          /* onHover: (value) {
            if (value) {
              iconToShow =
                  (widget.onHoverIcon ??
                      widget.icon);
            } else {
              iconToShow = widget.icon;
            }
            setState(() {});
          }, */
          child: Icon(
            Icons.camera_alt_rounded,
            size: 52,
            color: StyleCustom.iconColor,
          )),
    );
  }
}