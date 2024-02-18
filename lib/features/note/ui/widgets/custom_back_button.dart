import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Feedback.forTap(context);
        context.pop();
      },
      child: Container(
          alignment: Alignment.center,
          height: 53,
          width: 53,
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            String.fromCharCode(Icons.arrow_back_ios_new_rounded.codePoint),
            style: TextStyle(
              inherit: false,
              fontSize: 27,
              fontWeight: FontWeight.w600,
              fontFamily: Icons.arrow_back_ios_new_rounded.fontFamily,
            ),
          )),
    );
  }
}
