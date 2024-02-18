import 'package:flutter/material.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            alignment: Alignment.center,
            height: 53,
            width: 53,
            decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              String.fromCharCode(Icons.edit_outlined.codePoint),
              style: TextStyle(
                inherit: false,
                fontSize: 27,
                fontWeight: FontWeight.w500,
                fontFamily: Icons.edit_outlined.fontFamily,
              ),
            )));
  }
}
