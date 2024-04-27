import 'package:flutter/material.dart';

class AppColor {
  static const Color backgroundColor = Color.fromARGB(255, 37, 37, 37);
  static const Color secondaryColor = Color.fromARGB(255, 34, 51, 59);
  static const Color textColor = Color.fromARGB(255, 255, 255, 255);
  static Color transparentTextColor =
      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7);
  static const Color noteCardTextColor = Color.fromARGB(255, 37, 37, 37);
  static const Color iconColor = Color.fromARGB(255, 255, 255, 255);
  static const Color errorColor = Color.fromARGB(255, 175, 6, 6);

  static const List<Color> notesColor = [
    Color.fromARGB(255, 255, 204, 128),
    Color.fromARGB(255, 255, 171, 145),
    Color.fromARGB(255, 230, 238, 155),
    Color.fromARGB(255, 207, 147, 217),
    Color.fromARGB(255, 128, 222, 234),
    Color.fromARGB(255, 244, 143, 177),
    Color.fromARGB(255, 128, 203, 196),
    Color.fromARGB(255, 255, 102, 102),
    Color.fromARGB(255, 102, 255, 102),
    Color.fromARGB(255, 102, 102, 255),
    Color.fromARGB(255, 255, 102, 255),
    Color.fromARGB(255, 255, 255, 102),
    Color.fromARGB(255, 102, 255, 255),
    Color.fromARGB(255, 255, 204, 255),
    Color.fromARGB(255, 204, 255, 255),
  ];
}
