import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleCustom {
  static Color iconColor = Colors.brown.shade400;

  //static Color iconBackgoundColor1 = Colors.deepOrange.shade200;
  static Color iconBackgoundColor1 = Colors.orange.shade100;
  static Color iconBackgoundColor2 = Colors.amberAccent.shade400;

  static Color backgoundColor3 = Colors.brown.shade900;
  static Color backgoundColor2 = Colors.brown.shade400;
  static Color backgoundColor1 = Colors.red.shade50;

  static Color titleColor = Color.fromARGB(255, 59, 59, 61);

  static TextStyle tittle = GoogleFonts.greatVibes(
    color: titleColor,
    fontSize: 72,
    fontWeight: FontWeight.w400,
  );

  static TextStyle subTittle = GoogleFonts.parisienne(
    color: const Color.fromRGBO(59, 59, 61, 1),
    fontSize: 46,
    fontWeight: FontWeight.w400,
  );

  static TextStyle body = GoogleFonts.scheherazadeNew(
  //static TextStyle body = GoogleFonts.courierPrime(
    //letterSpacing: 0.1,
    //wordSpacing: 0.1,
    color: const Color.fromARGB(255, 59, 59, 61),
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle timer = GoogleFonts.b612Mono(
    color: const Color.fromARGB(255, 59, 59, 61),
    fontSize: 36,
    fontWeight: FontWeight.w200,
  );
}
