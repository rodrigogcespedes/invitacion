// Place fonts/CustomIcons.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: CustomIcons
//      fonts:
//       - asset: fonts/CustomIcons.ttf
import 'package:flutter/widgets.dart';

class CustomIcons {
  CustomIcons._();

  static const String _fontFamily = 'CustomIcons';

  static const IconData bow_tie = IconData(0x2200, fontFamily: _fontFamily);
  static const IconData gift = IconData(0x2201, fontFamily: _fontFamily);
  static const IconData gift_open = IconData(0x2202, fontFamily: _fontFamily);
}
