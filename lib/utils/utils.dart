import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class Utils {
  static int colorIndex = 0;
  static Color getNoteColor() {
    if (colorIndex == AppColor.notesColor.length) {
      colorIndex = 0;
    }
    return AppColor.notesColor[colorIndex++];
  }

  static String formatDate(String inputDate) {
    DateTime parsedDate = DateTime.parse(inputDate);

    String formattedDate = DateFormat('MMM dd, yyyy').format(parsedDate);

    return formattedDate;
  }
}
